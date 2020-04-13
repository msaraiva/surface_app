defmodule SurfaceAppWeb.Card do
  use Surface.Component

  @doc "The title"
  property title, :string, required: true

  @doc "The main content"
  slot default, required: true

  @doc "The footer"
  slot footer

  def render(assigns) do
    ~H"""
    <div class="card">
      <header class="card-header" style="background-color: #f5f5f5">
        <p class="card-header-title">
          {{ @title }}
        </p>
      </header>
      <div class="card-content">
        <div class="content">
          <slot/>
        </div>
      </div>
      <footer class="card-footer" style="background-color: #f5f5f5">
        <slot name="footer">
          <div class="card-footer-item">
            No footer defined. Using a fallback :)
          </div>
        </slot>
      </footer>
    </div>
    """
  end
end
