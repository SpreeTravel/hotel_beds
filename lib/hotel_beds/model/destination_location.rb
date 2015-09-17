require "hotel_beds/model"

module HotelBeds
  module Model
    class DestinationLocation
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :transfer_zone, String
    end
  end
end
