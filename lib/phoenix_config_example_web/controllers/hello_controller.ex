defmodule PhoenixConfigExampleWeb.HelloController do
  use PhoenixConfigExampleWeb, :controller

  def hello(conn, _params) do
    conn
    |> fetch_session()
    |> put_session(:message, "value")
    |> send_resp(200, Jason.encode!(%{hello: "World"}))
  end
end
