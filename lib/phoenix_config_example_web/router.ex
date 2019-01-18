defmodule PhoenixConfigExampleWeb.Router do
  use PhoenixConfigExampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixConfigExampleWeb do
    pipe_through :api
  end
end
