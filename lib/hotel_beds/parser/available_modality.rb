require "hotel_beds/parser"
require "hotel_beds/parser/price"
require "hotel_beds/parser/contract"

module HotelBeds
  module Parser
    class AvailableModality
      include HotelBeds::Parser

      # attributes
      attribute :code, attr: "code"
      attribute :name, attr: "Name"
      attribute :type, attr: "Type"
      attribute :mode, attr: "Mode"
      attribute :adult_count, selector: "HotelOccupancy AdultCount"
      attribute :child_ages, attr: "ChildAge"
      attribute :content_sequence, attr: "ContentSequence"

      attribute :prices,
        selector: "PriceList > Price", multiple: true,
        parser: HotelBeds::Parser::Price
      attribute :contract,
        selector: "Contract", multiple: true,
        parser: HotelBeds::Parser::Contract
    end
  end
end
