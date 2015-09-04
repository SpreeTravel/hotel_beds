require "hotel_beds/model/price"
require "hotel_beds/model/contract"


module HotelBeds
  module Model
    class AvailableModality
      # attributes
      attribute :id, Integer
      attribute :room_count, Integer
      attribute :description, String
      attribute :board, String
      attribute :board_code, String
      attribute :room_type_code, String
      attribute :room_type_characteristic, String
      attribute :price, BigDecimal
      attribute :number_available, Integer
      attribute :rates, Hash[Date => BigDecimal]
      attribute :cancellation_policies, Array[HotelBeds::Model::CancellationPolicy],
        default: Array.new
      attribute :customers, Array[HotelBeds::Model::Customer],
        default: Array.new

      def rates=(values)
        if values.kind_of?(Array)
          prices = values.map do |attrs|
            HotelBeds::Model::Price.new(attrs)
          end
          hash = prices.each_with_object(Hash.new) do |price, result|
            price.dates.each do |date|
              result[date] = price.amount
            end
          end
          super(hash)
        else
          super
        end
      end
    end
  end
end
