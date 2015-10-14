require "hotel_beds/model"

module HotelBeds
  module Model
    class Feature
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :name, String
    end
  end
end
