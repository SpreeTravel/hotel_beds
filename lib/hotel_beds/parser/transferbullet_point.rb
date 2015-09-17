require "hotel_beds/parser"

module HotelBeds
  module Parser
    class TransferBulletPoint
      include HotelBeds::Parser

      # attributes
      attribute :description, attr: "Description"
      attribute :detailed_description, selector: "DetailedDescription"
    end
  end
end
