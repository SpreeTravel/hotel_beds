require "hotel_beds/parser"

module HotelBeds
  module Parser
    class ProductRoom
      include HotelBeds::Parser

      # attributes
      attribute :company_code, selector: "CompanyCode"
      attribute :room_code, selector: "RoomCode"
    end
  end
end
