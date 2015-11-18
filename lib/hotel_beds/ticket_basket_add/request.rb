require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model"
require "hotel_beds/model/destination"
require "hotel_beds/model/occupancy"


module HotelBeds
  module TicketBasketAdd
    class Request < HotelBeds::Action::Request
      class TicketService
        include HotelBeds::Model

        # attributes
        attribute :avail_token, String
        attribute :contract_name, String
        attribute :contract_incoming_office_code, String
        attribute :date_from, Date
        attribute :date_to, Date
        attribute :ticket_code, String
        attribute :currency, String

        attribute :available_modality, String
        attribute :destination, HotelBeds::Model::Destination
        attribute :occupancy, HotelBeds::Model::Occupancy

        # validation
        # validates :destination_code, length: { is: 3, allow_blank: false }
        # validates :rooms, length: { minimum: 1, maximum: 5 }
        validates :token, :contract_name,
          :contract_incoming_office_code, :date_from, :date_to,
          :available_modality, presence: true
        # validate do |service|
        #   unless (1..5).cover?(service.rooms.size)
        #     service.errors.add(:rooms, "quantity must be between 1 and 5")
        #   end
        #   unless service.rooms.all?(&:valid?)
        #     service.errors.add(:rooms, "are invalid")
        #   end
        # end
      end

      # attributes
      attribute :session_id, String, default: SecureRandom.hex[0..15]
      attribute :service, TicketService

      # validation
      validates :session_id, :service, presence: true
    end
  end
end
