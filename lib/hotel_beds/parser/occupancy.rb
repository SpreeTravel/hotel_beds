require "hotel_beds/parser"

module HotelBeds
  module Parser
    class Occupancy
      include HotelBeds::Parser

      # attributes
      attribute :adult_count, attr: "Occupancy > AdultCount"
      attribute :name, selector: "Occupancy > ChildCount"
    end
  end
end
