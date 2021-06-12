defmodule Backend.Posts do
  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Posts.Post

  @doc """
  Returns the list of posts.
  """
  def list_posts(query) do
    Repo.all(query)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.
  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.
  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.
  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.
  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.
  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

   @doc """
  Returns the list of posts filtered by params.
  """
  def q_filtered_by(query, params) do
    Enum.reduce(params, query, fn({key, value}, query) ->
      case String.downcase(key) do
        _ ->
          from p in query,
          where: field(p, ^String.to_atom(key)) == ^value
      end
    end)
  end

   @doc """
  Returns the list of posts sort by params.
  """
  def q_sorted_by(query, params) do
    Enum.reduce(params, query, fn({key, value}, query) ->
      sort_type =
        case value do
          "asc" -> :asc
          _ -> :desc
        end
      case String.downcase(key) do
        _ ->
          key = String.to_existing_atom(key)
          from p in query,
          order_by: [{^sort_type, ^key}]
      end
    end)
  end
end
