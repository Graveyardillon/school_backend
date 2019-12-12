defmodule SchoolBackend.Schema.Student do

  use Ecto.Schema
  import Ecto.Changeset
  alias SchoolBackend.Schema.Student
  alias Comeonin.Bcrypt
 
  schema "students" do
    field :name, :string
    field :password, :string
 
    timestamps()
  end

  def changeset(%Student{}=student, attrs) do
    student
    |> cast(attrs, [:name, :password])
    |> validate_required([:name, :password])
    |> unique_constraint(:name)
    # |> validate_length(:password, min: 6)
    # |> validate_format(:password, ~r/[A-Z]+/, message: "Password must contain an upper-case letter.")
    # |> validate_format(:password, ~r/[a-z]+/, message: "Password must contain a lower-case letter.")
    # |> validate_format(:password, ~r/[0-9]+/, message: "Password must contain a number.")
    # |> validate_format(:password, ~r/[#\!\?&@\$%^&*\(\)]+/, message: "Password must contain a symbol.")
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
  defp put_pass_hash(changeset), do: changeset
 
end 