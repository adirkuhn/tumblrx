defmodule TumblrxWeb.UserView do
  use TumblrxWeb, :view
  alias TumblrxWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email
    }
  end

  def render("jwt.json", %{jwt: token}) do
    %{jwt: token}
  end
end
