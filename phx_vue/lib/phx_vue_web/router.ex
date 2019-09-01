defmodule PhxVueWeb.Router do
  use PhxVueWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxVueWeb do
    pipe_through :browser

    get "/", PageController, :index
    
  end

  # Other scopes may use custom stacks.
  scope "/api", PhxVueWeb do
      pipe_through :api
      resources "/todo", PostController, except: [:new, :edit]
  end
end
