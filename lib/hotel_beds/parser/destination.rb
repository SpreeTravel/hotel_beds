require "hotel_beds/parser"

module HotelBeds
  module Parser
    class Destination
      include HotelBeds::Parser

      # attributes
      attribute :code, attr: "code"
      attribute :type, attr: "type"
      attribute :name, selector: "Name"
    end
  end
end
