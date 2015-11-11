require "hotel_beds/model"
require "hotel_beds/model/destination"
require "hotel_beds/model/transferbullet_point"
module HotelBeds
  module Model
    class Transfer
      include HotelBeds::Model

      # attributes
      attribute :availability_token, String
      attribute :transfer_type, String

      attribute :contract, HotelBeds::Model::Contract

      attribute :date_from, Date
      attribute :time_from, Integer
      attribute :currency, String
      attribute :total_amount, BigDecimal
      attribute :net_price, BigDecimal

      attribute :code, String
      attribute :type, String
      attribute :type_code, String
      attribute :vehicle_type, String
      attribute :vehicle_type_code, String
      attribute :description, String
      attribute :images, Array[String]
      attribute :max_waiting, Integer

      attribute :adult, Integer
      attribute :child, Integer

      # attribute :pick_location, String
      attribute :pick_location_code, String
      attribute :pick_location_type, String
      attribute :dest_location_code, String
      attribute :dest_location_type, String

      attribute :duration, Integer

      attribute :vehicle_type, String
      attribute :product_type, String
      attribute :service_type, String
      attribute :product_specification, Array[String]


      # attribute :ticket_zone, String
      # attribute :transferbullet_point, Array[HotelBeds::Model::TransferBulletPoint]

    end
  end
end
