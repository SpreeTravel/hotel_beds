require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model/requested_room"

module HotelBeds
  module HotelDetail
    class Request < HotelBeds::Action::Request
      # attributes
      attribute :session_id, String, default: SecureRandom.hex[0..15]
      attribute :code, Integer

      # validation
      validates :session_id, :code, presence: true
    end
  end
end
