require "hotel_beds/parser"

module HotelBeds
  module Parser
    class ProductFeature
      include HotelBeds::Parser

      # attributes
      attribute :type, selector: "Feature",  attr: "type"
      attribute :name, selector: "Name"
      attribute :description, selector: "Description"
      attribute :value, selector: "Value"
    end
  end
end
