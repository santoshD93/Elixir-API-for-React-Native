defmodule BackendWeb.PostController do
  use BackendWeb, :controller

  alias Backend.Posts
  alias Backend.Posts.Post

  action_fallback BackendWeb.FallbackController

  plug :valid_filters, ~w(status) when action in [:index]
  plug :valid_sort, ~w(published_at title) when action in [:index]

  def index(conn, _params) do
    posts = Post
    |> Posts.q_filtered_by(conn.assigns.filters)
    |> Posts.q_sorted_by(conn.assigns.sort)
    |> Posts.list_posts
    render(conn, "index.json", posts: posts)
  end

  def create(conn, %{"post" => post_params}) do
    with {:ok, %Post{} = post} <- Posts.create_post(post_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.post_path(conn, :show, post))
      |> render("show.json", post: post)
    else
      {:error, %Ecto.Changeset{errors: errors}} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("errors.json", errors: errors)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    render(conn, "show.json", post: post)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Posts.get_post!(id)

    with {:ok, %Post{} = post} <- Posts.update_post(post, post_params) do
      render(conn, "show.json", post: post)
    else
      {:error, %Ecto.Changeset{errors: errors}} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("errors.json", errors: errors)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Posts.get_post!(id)

    with {:ok, %Post{}} <- Posts.delete_post(post) do
      send_resp(conn, :no_content, "")
    end
  end

  def valid_filters(conn, params) do
    filters = Enum.filter(conn.params, fn({k, v}) ->
      Enum.member?(params, k) && !is_blank(v)
    end)
    conn |> assign(:filters, filters)
  end

  def valid_sort(conn, params) do
    sort = Enum.filter(conn.params, fn({k, v}) ->
       Enum.member?(params, k)
    end)
    conn |> assign(:sort, sort)
  end

  def is_blank(val) when is_binary(val), do: String.trim(val) == ""
end
