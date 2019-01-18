defmodule PhoenixConfigExampleWeb.HelloController do
  use PhoenixConfigExampleWeb, :controller

  def hello(conn, _params) do
    conn
    |> send_resp(
      200,
      Jason.encode!(%{
        hello: "World"
      })
    )
  end
end
