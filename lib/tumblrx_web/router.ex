defmodule TumblrxWeb.Router do
  use TumblrxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", TumblrxWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController
  end
end
