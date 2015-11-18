require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model/requested_room"
require "hotel_beds/model/destination_location"
require "hotel_beds/model/occupancy"
require "hotel_beds/model/pickup_location"
require "hotel_beds/model/service_date"

module HotelBeds
  module TransferSearch
    class Request < HotelBeds::Action::Request
      # attributes
      attribute :session_id, String, default: SecureRandom.hex[0..15]
      # seams that there is no pagination for transfer
      # attribute :page_number, Integer, default: 1
      # attribute :items_per_page, Integer, default: 50
      attribute :service_date, Array[HotelBeds::Model::ServiceDate]
      attribute :pickup_location, String
      attribute :destination_location, Integer

      attribute :occupancy, HotelBeds::Model::Occupancy
      attribute :return_contents, String
      attribute :avail_data_type, Array[String]



      # validation
      # validates :pickup_location, length: { is: 3, allow_blank: false }
      validates :session_id, :service_date, :destination_location, :pickup_location, presence: true
      # validates :page_number, numericality: {
      #   greater_than: 0, only_integer: true
      # }

      validate :service_date_in_pass
      def service_date_in_pass
        errors.add(:service_date, "can't be in the past") if
            service_date.first.date.blank? and service_date.first.date < Date.today
      end

    end
  end
end
