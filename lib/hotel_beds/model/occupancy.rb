require "hotel_beds/model"

module HotelBeds
  module Model
    class Occupancy
      include HotelBeds::Model

      # attributes
      attribute :adult_count, Integer
      attribute :child_count, Integer
    end
  end
end
