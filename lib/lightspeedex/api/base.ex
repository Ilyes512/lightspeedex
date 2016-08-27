defmodule Lightspeedex.Api.Base do

  alias Lightspeedex.Config
  alias Lightspeedex.JSON

  def get(url_part, params \\ []) do
    do_get(url_part, nil, params)
  end

  def get_into(url_part, model, params \\ []) do
    do_get(url_part, model, params)
  end

  defp do_get(url_part, model, params) do
    config = Config.get

    [url_part, params]
    |> build_url
    |> HTTPoison.get!([{"Authorization", "Basic " <> config.authorization_token}])
    |> handle_response(model)
  end

  defp handle_response(data, model) do
    body = JSON.decode!(data.body, model)

    case data.status_code do
      200 -> %{
        status_code: 200,
        body: body,
        headers: data.headers,
      }
      _ -> {:error, data}
    end
  end

  defp build_url([url_part, []]) do
    config = Config.get

    "#{config.base_url}#{url_part}"
  end
  defp build_url([url_part, params]) do
    config = Config.get

    "#{config.base_url}#{url_part}#{build_params(params)}"
  end

  defp build_params([]), do: ""
  defp build_params(params), do: build_params(params, "")
  defp build_params([h | []], string) do
    {key, value} = h

    string <> "&#{key}=#{value}"
  end
  defp build_params([h | t], "") do
    {key, value} = h

    build_params(t, "?#{key}=#{value}")
  end
  defp build_params([h | t], string) do
    {key, value} = h

    build_params(t, string <> "&#{key}=#{value}")
  end
end
