defmodule Counter do
  use Surface.LiveComponent

  data count, :integer, default: 32

  def render(assigns) do
    ~H"""
    <div>
      <#Style>
        border: solid 1px #ccc;
        border-radius: 10px;
        padding: 10px;

        .title {
          font-size: {{ @count }} + px;
        }

        > .subtitle {
          color: {{ get_color(@count) }};
          &:hover {
            color: 10px;
          }
        }
      </#Style>
      <div>
        <button class="button is-info" :on-phx-click="dec">
          -
        </button>
        <button class="button is-info" :on-phx-click="inc">
          +
        </button>
      </div>
      <h1 class="title">font-size: {{ @count }}</h1>
      <h1 class="subtitle">color: {{ get_color(@count) }}</h1>
    </div>
    """
  end

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end

  def get_color(count) do
    Enum.at(["red", "green", "black"], rem(count, 3))
  end
end
