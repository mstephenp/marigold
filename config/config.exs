# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config



config :marigold_web,
  generators: [context_app: :marigold]

# Configures the endpoint
config :marigold_web, MarigoldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Phx56kqECab+VqDn9V9eLOCmZLj0HBJ1Njm1s8I8QL6RUk/RDTH/pOWIckyAtwsU",
  render_errors: [view: MarigoldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Marigold.PubSub,
  live_view: [signing_salt: "JQleernH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
