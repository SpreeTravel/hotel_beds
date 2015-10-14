require "hotel_beds/model"
require "hotel_beds/model/available_room"
require "hotel_beds/model/contract"
require "hotel_beds/model/destination"
require "hotel_beds/model/image"
require "hotel_beds/model/product_room"
require "hotel_beds/model/product_feature"


module HotelBeds
  module Model
    class HotelDetail
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :name, String
      attribute :description, String
      attribute :images, Array[HotelBeds::Model::Image]
      attribute :features, Array[HotelBeds::Model::ProductFeature]
      attribute :longitude, BigDecimal
      attribute :latitude, BigDecimal
      # attribute :available_rooms, Array[HotelBeds::Model::AvailableRoom]
      # attribute :contact, HotelBeds::Model::Contract
      attribute :destination, HotelBeds::Model::Destination
      attribute :stars, String
      attribute :chain, String
      attribute :product_rooms, Array[HotelBeds::Model::ProductRoom]

    end
  end
end
