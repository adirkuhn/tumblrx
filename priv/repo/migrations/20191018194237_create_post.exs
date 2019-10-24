defmodule Tumblrx.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :type, :string
      add :title, :string
      add :image, :string
      add :video, :string
      add :content, :string
      add :tags, :string

      timestamps()
    end

    create index(:posts, :tags)
    create index(:posts, :title)
    create index(:posts, :content)
    create index(:posts, :type)
  end
end
