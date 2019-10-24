# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tumblrx,
  ecto_repos: [Tumblrx.Repo]

# Configures the endpoint
config :tumblrx, TumblrxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EEDQX2sdVWbp7sq2q0qQRWazA8P9D9uhFcWwximbfoUiJgXESsknm97D2hPLSJUe",
  render_errors: [view: TumblrxWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Tumblrx.PubSub, adapter: Phoenix.PubSub.PG2]

config :tumblrx, Tumblrx.Guardian,
  issuer: :tumblrx,
  secret_key: "ZByBZqG7MAR3YV9MaOstwKaEK+ffVgm85BJIEhijhivEa89XxxWuQPsdl7Ujd8MR"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
