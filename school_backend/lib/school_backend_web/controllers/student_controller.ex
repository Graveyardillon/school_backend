defmodule SchoolBackendWeb.StudentController do
  use SchoolBackendWeb, :controller
  alias SchoolBackend.Functions.Auth
  alias SchoolBackend.Schema.Student
  alias SchoolBackend.Repo




  def create(conn, _student) do
    IO.inspect("params=")
    IO.inspect(conn)
    student_params = 
      %{"name" => conn.params["name"],"password" => conn.params["password"]}
      |>IO.inspect
      
      case Auth.create_student(student_params) do
        {:ok, student} -> 
          redirect(conn,to: Routes.page_path(conn, :index))
  
        {:error, %Ecto.Changeset{} = changeset} ->
          send_resp(conn, 502, "Oops, something went wrong!")
      end
  end

  def delete(conn, %{"id" => id}) do
    Auth.get_student!(Student, id)
    |>Auth.delete_student()

    conn
    |> put_flash(:info, "削除しました")
    |> redirect(to: Routes.page_path(conn, :index))
  end

end