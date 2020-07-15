defmodule Components.CounterDynamic do
  use Surface.LiveComponent

  data count, :integer, default: 1
  data color, :string, default: "green"

  style vars: ["--my-color": ^color] do
    scss """
    border: solid 3px var(--my-color);
    border-radius: 10px;
    padding: 10px;

    .subtitle #color-span {
      color: var(--my-color);

      &:hover {
        color: blue;
      }
    }
    """
  end

  def render(assigns) do
    ~H"""
    <div>
      <div>
        <button class="button is-info" :on-phx-click="dec">
          -
        </button>
        <button class="button is-info" :on-phx-click="inc">
          +
        </button>
      </div>
      <h2 class="title">Count: {{ @count }}</h2>
      <h2 class="subtitle">Color: <span id="color-span">{{ @color }}</span></h2>
    </div>
    """
  end

  def handle_event("inc", _, socket) do
    count = socket.assigns.count + 1
    {:noreply, assign(socket, count: count, color: get_color(count))}
  end

  def handle_event("dec", _, socket) do
    count = socket.assigns.count - 1
    {:noreply, assign(socket, count: count, color: get_color(count))}
  end

  def get_color(count) do
    colors = ["black", "green", "orange", "red"]
    index = rem(count, length(colors))
    Enum.at(colors, index)
  end
end
