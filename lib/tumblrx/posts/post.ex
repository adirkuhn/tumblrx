defmodule Tumblrx.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  
  @valid_post_type ["text", "image", "video"]

  schema "posts" do
    field :type, :string
    field :title, :string
    field :image, :string
    field :video, :string
    field :content, :string
    field :tags, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do

    post
    |> cast(attrs, [:type, :title, :content, :image, :video, :tags])
    |> validate_required([:type])
    |> validate_inclusion(:type,  @valid_post_type,  message: "Invalid post type")
    |> validate_by_post_type
  end

  defp validate_by_post_type(post) do
    case String.to_atom(post.changes.type) do
      :text ->
        validate_required(post, [:title, :content])
      :image ->
        validate_required(post, [:image])
      :video ->
        validate_required(post, [:video])
    end
    
    post
  end
end