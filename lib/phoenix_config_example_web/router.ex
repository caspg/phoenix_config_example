defmodule PhoenixConfigExampleWeb.Router do
  use PhoenixConfigExampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixConfigExampleWeb do
    pipe_through :api

    get "/", HelloController, :hello
  end
end
