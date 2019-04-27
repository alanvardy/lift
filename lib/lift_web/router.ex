defmodule LiftWeb.Router do
  use LiftWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiftWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/exercises", ExerciseController
    resources "/sets", SetController
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiftWeb do
  #   pipe_through :api
  # end
end
