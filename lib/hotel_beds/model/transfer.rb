require "hotel_beds/model"
require "hotel_beds/model/destination"
require "hotel_beds/parser/availablemodality_grouper"

module HotelBeds
  module Model
    class Transfer
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

    end
  end
end
