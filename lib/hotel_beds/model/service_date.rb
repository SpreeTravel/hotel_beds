require "hotel_beds/model"

module HotelBeds
  module Model
    class ServiceDate
      include HotelBeds::Model

      # attributes
      attribute :date, Date
      attribute :time, Time
    end
  end
end
