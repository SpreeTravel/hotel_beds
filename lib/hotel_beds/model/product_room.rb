require "hotel_beds/model"
require "hotel_beds/model/available_room"
require "hotel_beds/model/contract"
require "hotel_beds/model/destination"
require "hotel_beds/parser/room_grouper"
require "hotel_beds/model/image"
require "hotel_beds/model/product_room"


module HotelBeds
  module Model
    class ProductRoom
      include HotelBeds::Model

      # attributes
      attribute :company_code, String
      attribute :room_code, String
      attribute :feature_code, String
      attribute :features, Array[HotelBeds::Model::Feature]

    end
  end
end
