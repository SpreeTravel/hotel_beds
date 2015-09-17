require "hotel_beds/model"

module HotelBeds
  module Model
    class PickupLocation
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :datetime, DateTime
    end
  end
end
