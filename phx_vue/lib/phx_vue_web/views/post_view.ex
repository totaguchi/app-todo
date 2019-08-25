defmodule PhxVueWeb.PostView do
  use PhxVueWeb, :view
  alias PhxVueWeb.PostView

  def render("index.json", %{todo: todo}) do
    %{data: render_many(todo, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      title: post.title,
      details: post.details,
      date: post.date,
      start: post.start,
      end: post.end}
  end
end
