require "hotel_beds/model"

module HotelBeds
  module Model
    class TransferBulletPoint
      include HotelBeds::Model

      # attributes
      attribute :description, String
      attribute :detailed_description, String
    end
  end
end
