defmodule SurfaceAppWeb.Router do
  use SurfaceAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {SurfaceAppWeb.LayoutView, :root}
  end

  scope "/", SurfaceAppWeb do
    pipe_through :browser

    live "/", App
  end
end
