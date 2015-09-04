require "hotel_beds/model"
require "hotel_beds/model/price"
require "hotel_beds/model/contract"


module HotelBeds
  module Model
    class AvailableModality
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :name, String
      attribute :type, String
      attribute :mode, String
      attribute :adult_count, Integer
      attribute :child_ages, Array[Integer], default: Array.new
      attribute :content_sequence, Integer
      attribute :prices, Array[HotelBeds::Model::Price],
                default: Array.new
      attribute :contract, HotelBeds::Model::Contract

      validates :child_ages, numericality: {
                                greater_than_or_equal_to: 4,
                                less_than_or_equal_to: 12,
                                only_integer: true,
                            }
    end
  end
end
