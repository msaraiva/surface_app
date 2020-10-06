defmodule SurfaceAppWeb.LayoutView do
  use SurfaceAppWeb, :view

  def render(_, assigns) do
    ~H"""
    <html lang="en">
      <head>
        {{ Phoenix.HTML.Tag.csrf_meta_tag() }}
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Surface App</title>
        <link rel="stylesheet" href={{ Routes.static_path(@conn, "/css/bulma-v0.8.0.css") }} />
        <script src={{ Routes.static_path(@conn, "/js/phoenix-v1.5.5.min.js") }}></script>
        <script src={{ Routes.static_path(@conn, "/js/phoenix_live_view-v0.15-dev.js") }}></script>
      </head>
      <body>
        <section class="hero is-info"><div class="hero-body" style="padding: 2.5rem 1.5rem">
          <div class="container">
            <h1 class="title">
              Surface UI
            </h1>
            <h2 class="subtitle">
              A <strong>server-side rendering</strong> component library for <strong>Phoenix</strong>
            </h2>
          </div>
        </div></section>
        <section class="section">
          <div class="container">
            {{ @inner_content }}
          </div>
        </section>
        <script type="module" src={{ Routes.static_path(@conn, "/js/app.js") }}></script>
      </body>
    </html>
    """
  end
end
