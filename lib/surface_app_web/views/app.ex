defmodule SurfaceAppWeb.App do
  use Surface.LiveView

  alias SurfaceAppWeb.Card

  def render(assigns) do
    ~H"""
    <div class="section" style="padding: 0rem 1.5rem">
      <div class="columns">
        <div class="column">
          <Card title="Card 1">
            <h1 class="title is-size-4">Surface</h1>

            Surface is a <strong>server-side rendering</strong> component library that allows developers to
            build <strong>rich interactive user-interfaces</strong>, writing minimal
            custom Javascript. Full documentation and live examples can be found at
            <a href="http://surface-demo.msaraiva.io">surface-demo.msaraiva.io</a>. Enjoy!

            <template slot="footer">
              <a href="#" class="card-footer-item">Link 1</a>
              <a href="#" class="card-footer-item">Link 2</a>
            </template>
          </Card>
        </div>
        <div class="column">
          <Card title="Card 2">
            <Counter id="counter"/>
            <br>
            An example of a stateful <strong>Live Component</strong>.
          </Card>
        </div>
      </div>
    </div>
    """
  end
end
