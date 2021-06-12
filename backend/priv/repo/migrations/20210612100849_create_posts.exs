defmodule Backend.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create_query = "CREATE TYPE status AS ENUM ('unpublished', 'published')"
    drop_query = "DROP TYPE status"
    execute(create_query, drop_query)

    create table(:posts) do
      add :title, :string
      add :body, :text
      add :status, :status
      add :published_at, :utc_datetime
      timestamps(inserted_at: :created_at)
    end
  end
end
