require "hotel_beds/parser/transfer"
require "hotel_beds/parser/supplier"
require "hotel_beds/parser/reference"

module HotelBeds
  module Parser
    class TransferService < Transfer
      # attributes
      attribute :id, attr: "SPUI"
      attribute :type, attr: "xsi:type"
      attribute :status, selector: "Status"
      attribute :date_from, selector: "DateFrom", attr: "date"
      attribute :date_to, selector: "DateTo", attr: "date"
      attribute :currency, selector: "Currency", attr: "code"
      attribute :amount, selector: "TotalAmount"
      attribute :supplier, selector: "Supplier",
        parser: HotelBeds::Parser::Supplier
      attribute :reference, selector: "Reference",
        parser: HotelBeds::Parser::Reference
    end
  end
end
