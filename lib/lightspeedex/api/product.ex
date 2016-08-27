defmodule Lightspeedex.Api.Product do

  import Lightspeedex.Api.Base
  alias Lightspeedex.Model.Product

  def get_products(params \\ []) do
    get_into("products.json", %{"products" => [%Product{}]}, params)
  end

  def get_products_count(params \\ []) do
    get("products/count.json", params)
  end

  def get_product(id) do
    get_into("products/#{id}.json", %{"product" => %Product{}})
  end
end
