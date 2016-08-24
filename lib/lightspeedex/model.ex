defmodule Lightspeedex.Model.ClientConfig do
  defstruct base_url: nil, authorization_token: nil
end

defmodule Lightspeedex.Model.Account do
  @derive [Poison.Encoder]
  defstruct [:id, :appId, :apiKey, :permissions, :ratelimit, :requests, :metafields, :signout]
end
