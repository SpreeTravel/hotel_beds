require "hotel_beds/parser"
require "hotel_beds/parser/price"
require "hotel_beds/parser/contract"

module HotelBeds
  module Parser
    class AvailableModality
      include HotelBeds::Parser

      # attributes
      attribute :id, selector: "HotelRoom", attr: "SHRUI"
      attribute :room_count, selector: "HotelOccupancy RoomCount"
      attribute :adult_count, selector: "HotelOccupancy AdultCount"
      attribute :child_count, selector: "HotelOccupancy ChildCount"
      attribute :number_available, selector: "HotelRoom", attr: "availCount"
      attribute :description, selector: "HotelRoom RoomType"
      attribute :board, selector: "HotelRoom Board"
      attribute :board_code, selector: "HotelRoom Board", attr: "code"
      attribute :room_type_code, selector: "HotelRoom RoomType", attr: "code"
      attribute :room_type_characteristic,
        selector: "HotelRoom RoomType", attr: "characteristic"
      attribute :price, selector: "HotelRoom > Price > Amount"
      attribute :cancellation_policies,
        selector: "HotelRoom CancellationPolicy", multiple: true,
        parser: HotelBeds::Parser::CancellationPolicy
      attribute :rates,
        selector: "Price PriceList Price", multiple: true,
        parser: HotelBeds::Parser::Price
      attribute :customers,
        selector: "HotelOccupancy GuestList Customer", multiple: true,
        parser: HotelBeds::Parser::Customer
    end
  end
end
