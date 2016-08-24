defmodule Lightspeedex do
  @moduledoc """
    Provides access to the SEOshop API.
  """

  @doc """
  Initialises and configures Lightspeedex with a `api_key`, `api_token`, `shop_lang` and `server`.

  ## Example
      iex(1)> Lightspeedex.Configure "XXXX", "XXXX", "XXXX", "XXXX"
      {:ok, []}
  """
  defdelegate configure(api_key, api_token, shop_lang, server), to: Lightspeedex.Config, as: :configure

  @doc """
  Initialises and configures Lightspeedex with a `api_key`, `api_token and `shop_lang`.

  ## Example
      iex(1)> Lightspeedex.Configure "XXXX", "XXXX", "XXXX"
      {:ok, []}
  """
  defdelegate configure(api_key, api_token, shop_lang), to: Lightspeedex.Config, as: :configure

  @doc """
  Initialises and configures Lightspeedex with config variables.

  ## Example
      iex(1)> Lightspeedex.Configure
      {:ok, []}
  """
  defdelegate configure, to: Lightspeedex.Config, as: :configure

  @doc """
  Make a get request.

  ## Example
      iex(1)> Lightspeedex.get("products/count.json", since_id: 11011, updated_at_max: "2016-01-1 10:10:10")
      %{body: %{count: 206},
        headers: [{"Date", "Wed, 24 Aug 2016 22:40:57 GMT"}, {"Server", "Apache"},
         {"X-Generated-By", "Webshopapp Api (www.webshopapp.com)"},
         {"X-RateLimit-Limit", "1000/12000/65535"},
         {"X-RateLimit-Remaining", "998/5557/59092"},
         {"X-RateLimit-Reset", "243/1143/83943"},
         {"X-Runtime", "75.4ms, 6.5MB (7Q, 10.7ms)"}, {"X-Server", "api01"},
         {"Content-Length", "13"}, {"Connection", "close"},
         {"Content-Type", "application/json; charset=utf-8"}], status_code: 200}

  """
  defdelegate get(url_part, params \\ []), to: Lightspeedex.Api.Base, as: :get

  @doc """
  Retrieve the Account resource.

  ## Example
      iex(1)> Lightspeedex.Api.Account.get_account
      %{body: %{"account" => %Lightspeedex.Model.Account{apiKey: "secret",
           appId: false, id: 12345,
           metafields: %{"resource" => %{"id" => false,
               "link" => "https://api.webshopapp.com/nl/account/metafields.json",
               "url" => "account/metafields"}},
           permissions: %{"resource" => %{"id" => false,
               "link" => "https://api.webshopapp.com/nl/account/permissions.json",
               "url" => "account/permissions"}},
           ratelimit: %{"resource" => %{"id" => false,
               "link" => "https://api.webshopapp.com/nl/account/ratelimit.json",
               "url" => "account/ratelimit"}},
           requests: %{"resource" => %{"id" => false,
               "link" => "https://api.webshopapp.com/nl/account/requests.json",
               "url" => "account/requests"}},
           signout: %{"resource" => %{"id" => false,
               "link" => "https://api.webshopapp.com/nl/account/signout.json",
               "url" => "account/signout"}}}},
        headers: [{"Date", "Wed, 24 Aug 2016 22:31:29 GMT"}, {"Server", "Apache"},
         {"X-Generated-By", "Webshopapp Api (www.webshopapp.com)"},
         {"X-RateLimit-Limit", "1000/12000/65535"},
         {"X-RateLimit-Remaining", "999/7017/60552"},
         {"X-RateLimit-Reset", "211/1711/84511"},
         {"X-Runtime", "83.0ms, 6.0MB (6Q, 25.0ms)"}, {"X-Server", "api01"},
         {"Content-Length", "742"}, {"Connection", "close"},
         {"Content-Type", "application/json; charset=utf-8"}], status_code: 200}
  """
  defdelegate get_account, to: Lightspeedex.Api.Account, as: :get_account
end
