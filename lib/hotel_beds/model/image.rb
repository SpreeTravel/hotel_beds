require "hotel_beds/model"

module HotelBeds
  module Model
    class Image
      include HotelBeds::Model

      # attributes
      attribute :description, String
      attribute :url, String
    end
  end
end
