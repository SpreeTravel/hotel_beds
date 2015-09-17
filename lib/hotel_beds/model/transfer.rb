require "hotel_beds/model"
require "hotel_beds/model/destination"
require "hotel_beds/model/transferbullet_point"
module HotelBeds
  module Model
    class Transfer
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :availability_token, String
      attribute :date_from, Date
      attribute :currency, Date
      attribute :total_amount, BigDecimal
      attribute :net_price, BigDecimal
      attribute :description, String
      attribute :images, Array[String]
      attribute :ticket_zone, String
      attribute :type, String
      attribute :vehicle_type, String
      attribute :contract, HotelBeds::Model::Contract
      attribute :transferbullet_point, Array[HotelBeds::Model::TransferBulletPoint]

    end
  end
end
