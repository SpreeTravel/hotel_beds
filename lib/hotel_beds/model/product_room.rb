require "hotel_beds/model"
require "hotel_beds/model/feature"


module HotelBeds
  module Model
    class ProductRoom
      include HotelBeds::Model

      # attributes
      attribute :company_code, String
      attribute :room_code, String
      attribute :feature_code, String
      attribute :room_features, Array[HotelBeds::Model::Feature]

    end
  end
end
