defmodule Lightspeedex.Api.Order do

  import Lightspeedex.Api.Base
  alias Lightspeedex.Model.Order

  def get_orders(params \\ []) do
    get_into("orders.json", %{"orders" => [%Order{}]}, params)
  end

  def get_orders_count(params \\ []) do
    get("products/count.json", params)
  end

  def get_order(id) do
    get_into("orders/#{id}.json", %{"order" => %Order{}})
  end
end
