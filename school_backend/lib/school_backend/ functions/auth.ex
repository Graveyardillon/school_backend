defmodule SchoolBackend.Functions.Auth do
  import Ecto.Query
  alias Comeonin.Bcrypt
  alias SchoolBackend.Repo
  alias SchoolBackend.Schema.Student

  
  def search_name(word) do
    query = from u in Student, where: like(u.name, ^("%#{word}%"))
    Repo.all(query)
  end
  # def search_word(word) do
  #   query = from u in Student, where: u.name == ^("word")
  #   Repo.all(query)
  # end

  def search_id(word) do
    query = from u in Student, where: u.id == ^word
    Repo.all(query)
  end

  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  def update_student(student, params) do
    student
    |> Student.changeset(params)
    |> Repo.update()
  end

  # def delete_student(Student, id) do
  #   Repo.get(Student, id)
  #   |>Repo.delete()
  # end

  def delete_student(student) do
    Repo.delete(student)
  end

  def get_student!(Student, id), do: Repo.get!(Student, id)

  
  def authenticate_student(id, plain_text_password) do
    query = from u in Student, where: u.id == ^id
    Repo.one(query)
    |> check_password(plain_text_password)
  end

  defp check_password(nil, _), do: {:error, "Incorrect id or password."}
  defp check_password(student, plain_text_password) do
    case Bcrypt.checkpw(plain_text_password, student.password) do
      true -> {:ok, student}
      false -> {:error, "Incorrect id or password."}
    end
  end
end