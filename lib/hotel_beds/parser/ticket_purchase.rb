require "hotel_beds/parser"
require "hotel_beds/parser/ticket_service"
# require "hotel_beds/parser/customer"
# require "hotel_beds/parser/reference"
require "hotel_beds/parser/payment_data"

module HotelBeds
  module Parser
    class TicketPurchase
      include HotelBeds::Parser

      # attributes
      attribute :token, attr: "purchaseToken"
      attribute :time_to_expiration, attr: "timeToExpiration"
      attribute :status, selector: "Status"
      attribute :agency_code, selector: "Agency > Code"
      attribute :language, selector: "Language"
      attribute :creation_user, selector: "CreationUser"
      attribute :services,
                selector: "ServiceList > Service", multiple: true,
                parser: HotelBeds::Parser::TicketService
      attribute :currency, selector: "Currency", attr: "code"
      attribute :payment_data, selector: "PaymentData",
                parser: HotelBeds::Parser::PaymentData

      # attribute :purchase_extra_info

      attribute :total_price, selector: "TotalPrice"
      attribute :pending_amount, selector: "PendingAmount"

      # attribute :holder, selector: "Holder",
      #   parser: HotelBeds::Parser::Customer
      # attribute :reference, selector: "Reference",
      #   parser: HotelBeds::Parser::Reference

    end
  end
end
