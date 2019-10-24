defmodule Tumblrx.Repo do
  use Ecto.Repo,
    otp_app: :tumblrx,
    adapter: Ecto.Adapters.Postgres
end
