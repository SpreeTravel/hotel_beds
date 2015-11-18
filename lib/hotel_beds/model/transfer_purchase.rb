require "hotel_beds/model"
require "hotel_beds/model/transfer_service"
require "hotel_beds/model/customer"
require "hotel_beds/model/reference"
require "hotel_beds/model/payment_data"

module HotelBeds
  module Model
    class TransferPurchase
      include HotelBeds::Model

      # attributes
      attribute :token, String
      attribute :time_to_expiration, Integer
      attribute :agency_reference, String
      attribute :status, String
      attribute :currency, String
      attribute :amount, BigDecimal
      attribute :services, Array[HotelBeds::Model::TransferService]
      attribute :holder, HotelBeds::Model::Customer
      attribute :reference, HotelBeds::Model::Reference
      attribute :payment_data, HotelBeds::Model::PaymentData
    end
  end
end
