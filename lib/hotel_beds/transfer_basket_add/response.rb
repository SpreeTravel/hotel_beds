require "hotel_beds/action/response"
require "hotel_beds/parser/transfer_purchase"

module HotelBeds
  module TransferBasketAdd
    class Response < HotelBeds::Action::Response
      def session_id
        request.session_id
      end

      def purchase
        HotelBeds::Parser::TransferPurchase.new(body.at_css("Purchase")).to_model
      end
    end
  end
end
