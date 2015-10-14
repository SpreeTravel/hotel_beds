require "hotel_beds/parser"

module HotelBeds
  module Model
    class ProductFeature
      include HotelBeds::Model

      # attributes
      attribute :type, String
      attribute :name, String
      attribute :description, String
      attribute :value, String
    end
  end
end
