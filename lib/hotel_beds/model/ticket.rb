require "hotel_beds/model"
require "hotel_beds/model/available_modality"
require "hotel_beds/model/destination"
require "hotel_beds/parser/modality_grouper"

module HotelBeds
  module Model
    class Ticket
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :availability_token, String
      attribute :name, String
      attribute :description, String
      attribute :images, Array[String]
      attribute :ticket_zone, String
      attribute :company_code, String
      attribute :ticket_class, String
      attribute :available_modality, Array[HotelBeds::Model::AvailableModality]
      attribute :destination, HotelBeds::Model::Destination

      def grouped_rooms(requested_modalities)
        HotelBeds::Parser::ModalityGrouper.new(requested_modalities, available_modalities).groups
      end
    end
  end
end
