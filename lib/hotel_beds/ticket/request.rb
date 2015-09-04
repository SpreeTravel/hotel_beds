require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model/requested_room"
require "hotel_beds/model/contract"

module HotelBeds
  module Ticket
    class Request < HotelBeds::Action::Request
      # attributes
      attribute :session_id, String, default: SecureRandom.hex[0..15]
      attribute :service_occupancy, Integer, default: 1
      attribute :items_per_page, Integer, default: 50
      attribute :date_from, Date
      attribute :date_to, Date
      attribute :classification, String
      attribute :ticket_zone, String
      attribute :contract, HotelBeds::Model::Contract
      attribute :ticket_zone, String
      attribute :modality_code, Integer, default: 1
      attribute :occupancy_list, String

      # validation
      validates :session_id, :date_from, :date_from, presence: true
      validates :modality_code, length: { minimum: 1, maximum: 13 }
      validates :page_number, numericality: {
        greater_than: 0, only_integer: true
      }
      validate do |search|
        unless (1..13).cover?(search.modality_code.size)
          search.errors.add(:modality_code, "Modality code must be between 1 and 13")
        end ## Quitar esto y modificarlo para modality que es un entero, no un array
        search.modelity_code.each do |room|
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
