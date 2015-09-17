require "securerandom"
require "hotel_beds/action/request"
#require "hotel_beds/model/requested_room"

module HotelBeds
  module TransferSearch
    class Request < HotelBeds::Action::Request
      # attributes
      attribute :session_id, String, default: SecureRandom.hex[0..15]
      attribute :page_number, Integer, default: 1
      attribute :items_per_page, Integer, default: 50
      attribute :check_in_date, Date
      attribute :check_out_date, Date
      attribute :destination_code, String
      attribute :hotel_codes, Array[Integer]
      attribute :rooms, Array[HotelBeds::Model::RequestedRoom]

      # validation
      validates :destination_code, length: { is: 3, allow_blank: false }
      validates :session_id, :check_in_date, :check_out_date, presence: true
      validates :rooms, length: { minimum: 1, maximum: 5 }
      validates :page_number, numericality: {
        greater_than: 0, only_integer: true
      }
      validate do |search|
        unless (1..5).cover?(search.rooms.size)
          search.errors.add(:rooms, "quantity must be between 1 and 5")
        end
        search.rooms.each do |room|
          unless room.valid?
            room.errors.full_messages.each do |message|
              search.errors.add(:rooms, message)
            end
          end
        end
      end
    end
  end
end
