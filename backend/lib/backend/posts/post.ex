defmodule Backend.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :status, Ecto.Enum, values: [:unpublished, :published], default: :unpublished
    field :published_at, :utc_datetime_usec

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :status, :published_at])
    |> validate_required([:title, :body])
  end
end
