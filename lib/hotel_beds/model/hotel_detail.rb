require "hotel_beds/model"
require "hotel_beds/model/available_room"
require "hotel_beds/model/contract"
require "hotel_beds/model/destination"
require "hotel_beds/model/image"
require "hotel_beds/model/product_room"


module HotelBeds
  module Model
    class HotelDetail
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :name, String
      attribute :description, String
      attribute :images, Array[HotelBeds::Model::Image]
      attribute :longitude, BigDecimal
      attribute :latitude, BigDecimal
      # attribute :available_rooms, Array[HotelBeds::Model::AvailableRoom]
      # attribute :contact, HotelBeds::Model::Contract
      attribute :destination, HotelBeds::Model::Destination
      attribute :stars, String
      attribute :chain, String
      arrtibute :product_room, Array[HotelBeds::Model::ProductRoom]
      # attribute :currency, String
      #
      # def grouped_rooms(requested_rooms)
      #   HotelBeds::Parser::RoomGrouper.new(requested_rooms, available_rooms).groups
      # end
    end
  end
end
