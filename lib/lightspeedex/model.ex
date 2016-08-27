defmodule Lightspeedex.Model.ClientConfig do
  defstruct base_url: nil, authorization_token: nil
end

defmodule Lightspeedex.Model.Account do
  @derive [Poison.Encoder]
  defstruct [:id, :appId, :apiKey, :permissions, :ratelimit, :requests, :metafields,
   :signout]
end

defmodule Lightspeedex.Model.Product do
  @derive [Poison.Encoder]
  defstruct [:id, :createdAt, :updatedAt, :isVisible, :data01, :data02, :data03, :url,
    :title, :fulltitle, :description, :content, :set, :brand, :categories, :deliverydata,
    :image, :images, :relations, :metafields, :reviews, :type, :attributes, :supplier,
    :tags, :variants, :movements]
end

defmodule Lightspeedex.Model.Order do
  @derive [Poison.Encoder]
  defstruct [:id, :createdAt, :updatedAt, :number, :status, :customStatusId, :channel,
    :remoteIp, :userAgent, :referralId, :priceCost, :priceExcl, :priceIncl, :weight,
    :volume, :colli, :gender, :birthDate, :nationalId, :email, :firstname, :middlename,
    :lastname, :phone, :mobile, :isCompany, :companyName, :companyCoCNumber,
    :companyVatNumber, :addressBillingName, :addressBillingStreet, :addressBillingStreet2,
    :addressBillingNumber, :addressBillingExtension, :addressBillingZipcode,
    :addressBillingCity, :addressBillingRegion, :addressBillingCountry,
    :addressShippingCompany, :addressShippingName, :addressShippingStreet,
    :addressShippingStreet2, :addressShippingNumber, :addressShippingExtension,
    :addressShippingZipcode, :addressShippingCity, :addressShippingRegion,
    :addressShippingCountry, :paymentId, :paymentStatus, :paymentIsPost,
    :paymentIsInvoiceExternal, :paymentTaxRate, :paymentBasePriceExcl,
    :paymentBasePriceIncl, :paymentPriceExcl, :paymentPriceIncl, :paymentTitle,
    :paymentData, :shipmentId, :shipmentStatus, :shipmentIsCashOnDelivery,
    :shipmentIsPickup, :shipmentTaxRate, :shipmentBasePriceExcl, :shipmentBasePriceIncl,
    :shipmentPriceExcl, :shipmentPriceIncl, :shipmentDiscountExcl, :shipmentDiscountIncl,
    :shipmentTitle, :shipmentData, :isDiscounted, :discountType, :discountAmount,
    :discountPercentage, :discountCouponCode, :isNewCustomer, :comment, :memo,
    :allowNotifications, :doNotifyNew, :doNotifyReminder, :doNotifyCancelled, :language,
    :customer, :invoices, :shipments, :products, :metafields, :quote, :events]
end

