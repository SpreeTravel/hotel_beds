require "hotel_beds/parser"

module HotelBeds
  module Parser
    class Image
      include HotelBeds::Parser

      # attributes
      attribute :description, selector: "Description"
      attribute :url, selector: "Url"
    end
  end
end
