defmodule PhxVue.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todo) do
      add :title, :string
      add :details, :text
      add :date, :string
      add :start, :string
      add :end, :string

      timestamps()
    end

  end
end
