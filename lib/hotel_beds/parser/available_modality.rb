require "hotel_beds/parser"
require "hotel_beds/parser/price"
require "hotel_beds/parser/contract"
require "hotel_beds/parser/operation_date"

module HotelBeds
  module Parser
    class AvailableModality
      include HotelBeds::Parser

      # attributes
      attribute :code, attr: "code"
      attribute :name, selector: "Name"
      attribute :type, attr: "Type"
      attribute :mode, attr: "Mode"
      attribute :adult_count, selector: "HotelOccupancy AdultCount"
      attribute :child_ages, attr: "ChildAge"
      attribute :content_sequence, attr: "ContentSequence"

      attribute :operation_dates,
        selector: "OperationDateList > OperationDate", multiple: true,
        parser: HotelBeds::Parser::OperationDate
      attribute :prices,
        selector: "PriceList > Price", multiple: true,
        parser: HotelBeds::Parser::Price
      attribute :contract,
        selector: "Contract",
        parser: HotelBeds::Parser::Contract
    end
  end
end
