defmodule Lightspeedex.JSON do
  @moduledoc """
  JSON encode/decode wrapper module.
  """

  @doc """
  Decode json string into elixir objects.
  """
  def decode(json, model \\ nil) do
    case model do
      nil -> Poison.decode(json, keys: :atoms)
      _ -> Poison.decode(json, as: model)
    end
  end

  @doc """
  Decode json string into elixir objects.
  """
  def decode!(json, model \\ nil) do
    case model do
      nil -> Poison.decode!(json, keys: :atoms)
      _ -> Poison.decode!(json, as: model)
    end
  end
end
