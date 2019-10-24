use Mix.Config

# Configure your database
config :tumblrx, Tumblrx.Repo,
  database: "tumblrx_test",
  username: "postgres",
  password: "",
  hostname: "localhost",
  # ssl: true,
  # ssl_opts: [
  #   cacertfile: "priv/AmazonRootCA1.pem"
  # ],
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tumblrx, TumblrxWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
