require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model/requested_room"
require "hotel_beds/model/contract"
require "hotel_beds/model/occupancy"


module HotelBeds
  module TicketValuation
    class Request < HotelBeds::Action::Request
      # attributes
      attribute :language, String, default: 'ENG'
      attribute :session_id, String, default: SecureRandom.hex[0..15]
      attribute :avail_token, String
      attribute :service_occupancy, Array[HotelBeds::Model::Occupancy]
      attribute :date_from, Date
      attribute :date_to, Date
      attribute :modality_code, String
      attribute :ticket_code, String



      # validation
      # validates :session_id, :avail_token, :contract_name, :contract_code, presence: true

    end
  end
end
