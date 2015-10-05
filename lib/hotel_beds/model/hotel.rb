require "hotel_beds/model"
require "hotel_beds/model/available_room"
require "hotel_beds/model/contract"
require "hotel_beds/model/destination"
require "hotel_beds/parser/room_grouper"

module HotelBeds
  module Model
    class Hotel
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :availability_token, String
      attribute :name, String
      attribute :images, Array[String]
      attribute :longitude, BigDecimal
      attribute :latitude, BigDecimal
      attribute :available_rooms, Array[HotelBeds::Model::AvailableRoom]
      attribute :contract, HotelBeds::Model::Contract
      attribute :destination, HotelBeds::Model::Destination
      attribute :stars, String

      def grouped_rooms(requested_rooms)
        HotelBeds::Parser::RoomGrouper.new(requested_rooms, available_rooms).groups
      end
    end
  end
end
