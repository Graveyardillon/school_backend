defmodule SchoolBackendWeb.Router do
  use SchoolBackendWeb, :router
  alias Routes

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SchoolBackendWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", SchoolBackendWeb do
    pipe_through :browser

    get "/searchid/:word", SearchController, :searchid
    get "/searchname/:word", SearchController, :searchname
    # get "/search"

    # get "/students", StudentController
    get "/create/:name/:password", StudentController, :create
    get "/delete/:id", StudentController, :delete
    
    post "/login", LoginController, :login
    post "/logout", LoginController, :logout
    post "/refresh_token", SessionController, :refresh_token
  end

  # Other scopes may use custom stacks.
  # scope "/api", SchoolBackendWeb do
  #   pipe_through :api
  # end
end