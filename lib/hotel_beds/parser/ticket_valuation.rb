require "hotel_beds/parser/ticket"
require "hotel_beds/parser/supplier"
require "hotel_beds/parser/contract"
require "hotel_beds/parser/reference"

module HotelBeds
  module Parser
    class TicketValuation < Ticket
      # attributes
      attribute :id, attr: "SPUI"
      attribute :type, attr: "xsi:type"
      attribute :status, selector: "Status"
      attribute :contract, selector: "ContractList > Contract",
                parser: HotelBeds::Parser::Contract
      attribute :supplier, selector: "Supplier",
                parser: HotelBeds::Parser::Supplier
      attribute :date_from, selector: "DateFrom", attr: "date"
      attribute :date_to, selector: "DateTo", attr: "date"
      attribute :currency, selector: "Currency", attr: "code"
      attribute :total_amount, selector: "TotalAmount"

    end
  end
end
