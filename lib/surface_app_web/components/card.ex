defmodule Components.Card do
  use Surface.LiveComponent

  @doc "The title"
  property title, :string, required: true

  @doc "The main content"
  slot default, required: true

  @doc "The footer"
  slot footer

  style do
    scss """
    .card-footer-item {
      font-size: 15px;

      &:not(:last-child) {
        border-right: 1px solid #dbdbdb;
      }
    }

    .card-header, .card-footer {
      background-color: #f5f5f5;
    }
    """
  end

  def render(assigns) do
    ~H"""
    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          {{ @title }}
        </p>
      </header>
      <div class="card-content">
        <div class="content">
          <slot/>
        </div>
      </div>
      <footer :if={{ @footer }} class="card-footer">
        <slot name="footer"/>
      </footer>
    </div>
    """
  end
end
