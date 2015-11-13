require "hotel_beds/model"
require "hotel_beds/model/available_modality"
require "hotel_beds/model/destination"
require "hotel_beds/parser/availablemodality_grouper"

module HotelBeds
  module Model
    class Ticket
      include HotelBeds::Model

      # attributes
      attribute :availability_token, String

      attribute :date_from, String
      attribute :date_to, String
      attribute :currency, String
      attribute :currency_code, String

      attribute :code, String
      attribute :name, String
      attribute :description, String
      attribute :images, Array[String]
      attribute :company_code, String
      attribute :ticket_class, String
      attribute :destination, HotelBeds::Model::Destination

      attribute :zone, String

      attribute :available_modality, Array[HotelBeds::Model::AvailableModality]

      attribute :adult_count, Integer
      attribute :child_count, Integer

    end
  end
end
