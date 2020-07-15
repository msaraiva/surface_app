defmodule SurfaceAppWeb.App do
  use Surface.LiveView

  alias Components.{Card, CounterStatic, CounterDynamic}

  def render(assigns) do
    ~H"""
    <div class="section" style="padding: 0rem 1.5rem">
      <br>
      <div class="columns">
        <div class="column">
          <Card title="Static CSS">
            <CounterStatic id="counter1"/>
            <hr>
            <CounterStatic id="counter2"/>
            <template slot="footer">
              <div class="card-footer-item">
                <a href="/css/components.css" target="_blank">See static CSS</a>
              </div>
            </template>
          </Card>
        </div>
        <div class="column">
          <Card title="Static & Dynamic CSS">
            <CounterDynamic id="counter3"/>
            <hr>
            <CounterDynamic id="counter4"/>
            <template slot="footer">
              <div class="card-footer-item">
                <a href="/css/components.css" target="_blank">See static CSS</a>
              </div>
              <div class="card-footer-item">
                Use dev tools to see dynamic CSS
              </div>
            </template>
          </Card>
        </div>
      </div>
    </div>
    """
  end
end
