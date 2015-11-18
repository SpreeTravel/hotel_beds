require "hotel_beds/model"

module HotelBeds
  module Model
    class OperationDate
      include HotelBeds::Model

      # attributes
      attribute :date, Integer
      attribute :min_duration, Integer
      attribute :max_duration, Integer

    end
  end
end
