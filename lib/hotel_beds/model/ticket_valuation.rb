require "hotel_beds/model"
require "hotel_beds/model/contract"
require "hotel_beds/model/supplier"
require "hotel_beds/parser/availablemodality_grouper"

module HotelBeds
  module Model
    class TicketValuation
      include HotelBeds::Model

      attribute :id, String
      attribute :type, String
      attribute :status, String
      attribute :contract, HotelBeds::Model::Contract
      attribute :supplier, HotelBeds::Model::Supplier
      attribute :date_from, Date
      attribute :date_to, Date
      attribute :currency, String
      attribute :total_amount, BigDecimal

      # AdditionalCostList
      # TicketInfo
      # AvailableModality
      # Paxes

    end
  end
end
