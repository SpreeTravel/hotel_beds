require "hotel_beds/parser"
require "hotel_beds/parser/hotel_service"
require "hotel_beds/parser/customer"
require "hotel_beds/parser/reference"
require "hotel_beds/parser/payment_data"

module HotelBeds
  module Parser
    class HotelPurchase
      include HotelBeds::Parser

      # attributes
      attribute :token, attr: "purchaseToken"
      attribute :time_to_expiration, attr: "timeToExpiration"
      attribute :agency_reference, selector: "AgencyReference"
      attribute :status, selector: "Status"
      attribute :currency, selector: "Currency", attr: "code"
      attribute :amount, selector: "TotalPrice"
      attribute :services,
        selector: "ServiceList > Service", multiple: true,
        parser: HotelBeds::Parser::HotelService
      attribute :holder, selector: "Holder",
        parser: HotelBeds::Parser::Customer
      attribute :reference, selector: "Reference",
        parser: HotelBeds::Parser::Reference
      attribute :payment_data, selector: "PaymentData",
        parser: HotelBeds::Parser::PaymentData
    end
  end
end
