defmodule Lightspeedex.Config do

  @base_urls %{
    live: "https://api.webshopapp.com/",
    local: "https://api.webstoreapp.com/",
    eu1: "https://api.webshopapp.com/",
    us1: "https://api.shoplightspeed.com/",
    test: "https://api.webshopapp.net/",
  }

  @doc """
  Set the configuration and initialise the process.
  """
  def configure(api_key, api_token, shop_lang, server \\ "live")
  def configure(api_key, api_token, shop_lang, server) do
    authorization_token = get_token(api_key, api_token)

    start_link(
      %Lightspeedex.Model.ClientConfig{
        base_url: get_base_url(server, shop_lang),
        authorization_token: authorization_token
      })
    {:ok, []}
  end
  def configure do
    api_key = Application.get_env(:lightspeedex, :api_key) || System.get_env("SEOSHOP_API_KEY")
    api_token = Application.get_env(:lightspeedex, :api_token) || System.get_env("SEOSHOP_API_TOKEN")
    shop_lang = Application.get_env(:lightspeedex, :shop_lang) || System.get_env("SEOSHOP_SHOP_LANG")
    server = Application.get_env(:lightspeedex, :server) || System.get_env("SEOSHOP_SERVER")

    start_link(
      %Lightspeedex.Model.ClientConfig{
        base_url: get_base_url(server, shop_lang),
        authorization_token: get_token(api_key, api_token)
      })
    {:ok, []}
  end

  @doc """
  Set a global authorization token
  """
  def configure(:global, token) do
    set(:authorization_token, token)
  end

  @doc """
  Get the configuration object
  """
  def get do
    Agent.get(__MODULE__, fn config -> config end)
  end

  defp set(key, value) do
    Agent.get(__MODULE__, fn config ->
      Map.update!(config, key, fn _ -> value end)
    end)
  end

  defp start_link(value) do
    Agent.start_link(fn -> value end, name: __MODULE__)
  end

  defp get_base_url(server, shop_lang) do
    Map.get(@base_urls, String.to_atom(server)) <> shop_lang <> "/"
  end

  defp get_token(api_key, api_token) do
    Base.encode64 "#{api_key}:#{api_token}"
  end
end
