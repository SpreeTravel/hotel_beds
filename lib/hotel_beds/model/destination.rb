require "hotel_beds/model"

module HotelBeds
  module Model
    class Destination
      include HotelBeds::Model

      # attributes
      attribute :code, String
      attribute :type, String
      attribute :name, String

      #TODO, validate code lenght
    end
  end
end
