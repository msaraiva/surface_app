defmodule Counter do
  use Surface.LiveComponent

  data count, :integer, default: 0

  def render(assigns) do
    ~H"""
    <div>
      <h1 class="title">Count: {{ @count }}</h1>
      <div>
        <button class="button is-info" :on-phx-click="dec">
          -
        </button>
        <button class="button is-info" :on-phx-click="inc">
          +
        </button>
      </div>
    </div>
    """
  end

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :count, & &1 + 1)}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :count, & &1 - 1)}
  end
end
