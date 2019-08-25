defmodule PhxVue.Api.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo" do
    field :date, :string
    field :details, :string
    field :end, :string
    field :start, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :details, :date, :start, :end])
    |> validate_required([:title, :details, :date, :start, :end])
  end
end
