defmodule BackendWeb.PostView do
  use BackendWeb, :view
  alias BackendWeb.PostView

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      title: post.title,
      body: post.body}
  end

  def render("errors.json", %{errors: errors}) do
    %{data: render_many(errors, PostView, "error.json")}
  end

  def render("error.json", %{post: {error_field, {message, _}}}) do
    %{
      error_field: message
    }
  end
end
