require "hotel_beds/action/response"
require "hotel_beds/parser/hotel_detail"

module HotelBeds
  module HotelDetail
    class Response < HotelBeds::Action::Response

      def session_id
        request.session_id
      end

      def currency
        body.at_css("Currency").attr("code")
      end

      def hotel
        HotelBeds::Parser::HotelDetail.new(body.css("Hotel")).to_model
      end

    end
  end
end
