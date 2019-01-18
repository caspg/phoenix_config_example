defmodule PhoenixConfigExampleWeb.HelloController do
  use PhoenixConfigExampleWeb, :controller

  def hello(conn, _params) do
    data = %{
      url: external_api_url()
    }

    conn
    |> fetch_session()
    |> put_session(:message, "value")
    |> send_resp(200, Jason.encode!(data))
  end

  defp external_api_url do
    Application.get_env(:phoenix_config_example, :external_api_url)
  end
end
