defmodule Components.CounterStatic do
  use Surface.LiveComponent

  data count, :integer, default: 0

  style do
    scss """
    $color: black;

    border: solid 3px $color;
    border-radius: 10px;
    padding: 10px;

    .subtitle #color-span {
      color: $color;

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
      <h2 class="subtitle">Color: <span id="color-span">black</span></h2>
    </div>
    """
  end

  def handle_event("inc", _, socket) do
    count = socket.assigns.count + 1
    {:noreply, assign(socket, count: count)}
  end

  def handle_event("dec", _, socket) do
    count = socket.assigns.count - 1
    {:noreply, assign(socket, count: count)}
  end
end
