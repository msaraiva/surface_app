defmodule SurfaceApp.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: SurfaceApp.PubSub},
      SurfaceAppWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: SurfaceApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SurfaceAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
