require "hotel_beds/model"
require "hotel_beds/model/ticket_service"
require "hotel_beds/model/customer"
require "hotel_beds/model/reference"
require "hotel_beds/model/payment_data"

module HotelBeds
  module Model
    class TicketPurchase
      include HotelBeds::Model

      # attributes
      attribute :token, String
      attribute :time_to_expiration, Integer
      attribute :status, String
      attribute :agency_code, String
      attribute :language, String
      attribute :creation_user, String
      attribute :services, Array[HotelBeds::Model::TicketService]

      attribute :currency, String
      attribute :payment_data, HotelBeds::Model::PaymentData

      attribute :total_price, BigDecimal
      attribute :pending_amount, BigDecimal

      # attribute :holder, HotelBeds::Model::Customer
      # attribute :reference, HotelBeds::Model::Reference

    end
  end
end
