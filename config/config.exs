use Mix.Config

# Configures the endpoint
config :surface_app, SurfaceAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UIegzxon3DL/eIG2KV0IyxHTbSEtw3y2FmtFEEa1/rF62pYoUkbaixV8s9XxdoJw",
  render_errors: [view: SurfaceAppWeb.ErrorView, accepts: ~w(json)],
  pubsub_server: SurfaceApp.PubSub,
  live_view: [
    signing_salt: "Pc9Ia8dj77Ti3S3SYOv5FmwtdH81NWDJ"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
