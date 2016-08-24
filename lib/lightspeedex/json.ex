defmodule Lightspeedex.JSON do
  @moduledoc """
  JSON encode/decode wrapper module.
  """

  @doc """
  Decode json string into elixir objects.
  """
  def decode!(json) do
    Poison.decode!(json, keys: :atoms)
  end

  @doc """
  Decode json string into elixir objects.
  """
  def decode(json) do
    Poison.decode(json, keys: :atoms)
  end

  def decode_into(json, model) do
    Poison.decode(json, as: model)
  end

  def decode_into!(json, model) do
    Poison.decode!(json, as: model)
  end
end
