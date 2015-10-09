require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model/requested_room"
require "hotel_beds/model/contract"
require "hotel_beds/model/occupancy"


module HotelBeds
  module TicketSearch
    class Request < HotelBeds::Action::Request
      # attributes
      attribute :session_id, String, default: SecureRandom.hex[0..15]
      attribute :items_per_page, Integer, default: 50
      attribute :page_number, Integer, default: 1
      attribute :date_from, Date
      attribute :date_to, Date
      attribute :destination, String
      attribute :service_occupancy, Array[HotelBeds::Model::Occupancy]


      # attribute :classification, String
      # attribute :ticket_zone, String
      # attribute :contract, HotelBeds::Model::Contract
      # attribute :ticket_zone, String
      # attribute :modality_code, Integer, default: 1
      # attribute :occupancy_list, String

      # validation
      validates :session_id, :date_from, :date_from, :destination, presence: true
      validates :page_number, numericality: {
        greater_than: 0, only_integer: true
      }


    end
  end
end
