defmodule SchoolBackend.Repo.Migrations.AddStudentsTable do
  use Ecto.Migration

  def change do
  create table(:students) do
    add :name, :string
    add :password, :string
    timestamps()
  end
    create unique_index(:students, [:name])

  end
end
