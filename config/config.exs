# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :wheeltater, WheeltaterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aBY33IUiuP0jCwhTuZafGh6g5+1r+76mVXYwpWVo1dGFISa8j+2YAZdKT7yLXEIP",
  render_errors: [view: WheeltaterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Wheeltater.PubSub,
  live_view: [signing_salt: "iVRwLcsv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
