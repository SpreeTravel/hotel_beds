require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model"
require "hotel_beds/model/available_room"
require "hotel_beds/model/occupancy"


module HotelBeds
  module TransferBasketAdd
    class Request < HotelBeds::Action::Request
      class TransferService
        include HotelBeds::Model

        # attributes
        attribute :avail_token, String
        attribute :contract_name, String
        attribute :contract_incoming_office_code, String
        attribute :date_from, Date
        # attribute :date_to, Date
        attribute :transfer_type, String
        attribute :currency, String


        attribute :transfer_code, String
        attribute :type, String
        attribute :vehicle_type, String
        attribute :occupancy, HotelBeds::Model::Occupancy
        attribute :pickup_location, String
        attribute :destination_location, Integer




        #
        #
        # attribute :destination_code, String
        # attribute :rooms, Array[HotelBeds::Model::AvailableRoom]

        # # validation
        # validates :destination_code, length: { is: 3, allow_blank: false }
        # validates :rooms, length: { minimum: 1, maximum: 5 }
        # validates :session_id, :availability_token, :contract_name,
        #   :contract_incoming_office_code, :check_in_date, :check_out_date,
        #   :hotel_code, presence: true
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
      attribute :service, TransferService

      # validation
      validates :session_id, :service, presence: true
    end
  end
end
