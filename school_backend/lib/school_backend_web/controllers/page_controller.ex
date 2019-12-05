defmodule SchoolBackendWeb.PageController do
  use SchoolBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
