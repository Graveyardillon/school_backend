defmodule SchoolBackendWeb.SearchController do
  use SchoolBackendWeb, :controller
  alias SchoolBackend.Functions.Auth
  alias SchoolBackend.Schema.Student

  def searchid(conn,_) do
        result = 
            conn.params["word"]
            |>Auth.search_id()
        json(conn,formatuser(result))
  end

  def searchname(conn,_) do
        result = 
            conn.params["word"]
            |>Auth.search_name()
        json(conn,formatuser(result))
  end

  defp formatuser(result) do
    Enum.map(result,fn(x) -> %{"name" => x.name,"id" => x.id} end )
  end
end