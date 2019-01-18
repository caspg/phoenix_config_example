use Mix.Config

config :phoenix_config_example,
  cookie_domain: System.get_env("COOKIE_DOMAIN")
  external_api_url: System.get_env("EXTERNAL_API_URL")
