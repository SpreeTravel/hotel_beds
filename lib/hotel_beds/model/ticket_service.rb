require "hotel_beds/model/ticket"
require "hotel_beds/model/supplier"
require "hotel_beds/model/contract"
require "hotel_beds/model/reference"

module HotelBeds
  module Model
    class TicketService < Ticket
      # attributes
      attribute :id, String
      attribute :type, String
      attribute :status, String
      attribute :contract, HotelBeds::Model::Contract
      attribute :supplier, HotelBeds::Model::Supplier
      attribute :date_from, Date
      attribute :date_to, Date
      attribute :currency, String
      attribute :total_amount, BigDecimal


      # attribute :reference, HotelBeds::Model::Reference
    end
  end
end
