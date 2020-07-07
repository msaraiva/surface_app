defmodule Style do
  use Surface.MacroComponent

  alias Surface.IOHelper
  alias Surface.MacroComponent

  @doc "Compress the resulting CSS"
  property compressed, :boolean, default: false

  @doc "The Sass code to be converted to CSS"
  slot default, required: true

  @impl true
  def translate({_, attributes, children, %{line: tag_line}}, caller) do
    props = MacroComponent.eval_static_props!(__MODULE__, attributes, caller)
    compressed = props[:compressed] || false

    open = [
      "<% require(#{inspect(__MODULE__)}) %>",
      "<style>\n",
    ]

    sass=
      children
      |> IO.iodata_to_binary
      |> wrap_expressions()
      |> wrap_style()

    output_style =
      if compressed, do: Sass.sass_style_compressed, else: Sass.sass_style_expanded

    css =
      case Sass.compile(sass, %{output_style: output_style}) do
        {:ok, css} ->
          css

        {:error, message} ->
          [_, line] = Regex.run(~r/on line (\d+) of stdin/, message)
          actual_line = caller.line + tag_line + String.to_integer(line) - 1
          IOHelper.compile_error(message, caller.file, actual_line)
      end

    close = ["</style>"]

    {open, css, close}
  end

  # TODO: This is a naive, non-optimized way to prepare expressions for
  # interpolation and should be replaced before the first stable release.
  defp wrap_expressions(code) do
    Regex.replace(~r/\{\{(\s*.+?\s*)\}\}/, code, fn _, expr ->
      expr = expr |> String.replace(~S["], ~S[\"]) |> String.trim()
      "unquote(\"<%= #{expr} %>\")"
    end)
  end

  defp wrap_style(code) do
    ~s([data-phx-component="<%= @myself %>"] { #{code} })
  end
end
