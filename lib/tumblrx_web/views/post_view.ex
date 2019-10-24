defmodule TumblrxWeb.PostView do
  use TumblrxWeb, :view
  alias TumblrxWeb.PostView

  def render("index.json", %{post: post}) do
    %{data: render_many(post, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      type: post.type}
  end
end
