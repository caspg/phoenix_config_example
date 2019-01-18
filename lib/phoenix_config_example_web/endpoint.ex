defmodule PhoenixConfigExampleWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :phoenix_config_example

  socket "/socket", PhoenixConfigExampleWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :phoenix_config_example,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  defmodule RuntimeSessionConfigPlug do
    # init is evaluated during compiletime
    def init(opts), do: Plug.Session.init(opts)

    def call(conn, opts) do
      # this is a hack to allow defining `domain`  during runtime/application boot
      domain = Application.get_env(:phoenix_config_example, :cookie_domain)
      runtime_opts = put_in(opts, [:cookie_opts, :domain], domain)

      Plug.Session.call(conn, runtime_opts)
    end
  end

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug RuntimeSessionConfigPlug,
    store: :cookie,
    key: "_phoenix_config_example_key",
    signing_salt: "75YwJFSe"

  plug PhoenixConfigExampleWeb.Router
end
