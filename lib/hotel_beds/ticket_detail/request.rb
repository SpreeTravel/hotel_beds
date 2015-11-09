require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model/requested_room"
require "hotel_beds/model/contract"
require "hotel_beds/model/occupancy"


module HotelBeds
  module TicketDetail
    class Request < HotelBeds::Action::Request
      # attributes
      attribute :language, String, default: 'ENG'
      attribute :session_id, String, default: SecureRandom.hex[0..15]
      attribute :code, String
      attribute :avail_token, String
      attribute :contract_name, String
      attribute :contract_code, Integer


      # validation
      validates :session_id, :code, :avail_token, :contract_name, :contract_code, presence: true

    end
  end
end
