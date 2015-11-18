require "hotel_beds/model"

module HotelBeds
  module Model
    class Occupancy
      include HotelBeds::Model

      # attributes
      attribute :adult_count, Integer, default: 0
      attribute :child_count, Integer, default: 0
      attribute :child_ages, Array[Integer]
      validates :adult_count, :child_count, numericality: {
        greater_than_or_equal_to: 0,
        less_than_or_equal_to: 4,
        only_integer: true,
      }
    end
  end
end
