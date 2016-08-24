defmodule Lightspeedex.Api.Account do

  import Lightspeedex.Api.Base
  alias Lightspeedex.Model.Account

  def get_account do
    get_into("account.json", %{"account" => %Account{}})
  end
end
