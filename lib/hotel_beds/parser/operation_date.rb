require "hotel_beds/parser"

module HotelBeds
  module Parser
    class OperationDate
      include HotelBeds::Parser

      # attributes
      attribute :date, selector: "OperationDate", attr: "date"
      attribute :min_duration, selector: "OperationDate", attr: "minimumDuration"
      attribute :max_duration, selector: "OperationDate", attr: "maximumDuration"
    end
  end
end
