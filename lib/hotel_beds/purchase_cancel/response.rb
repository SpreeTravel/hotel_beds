require "hotel_beds/action/response"
require "hotel_beds/parser/hotel_purchase"

module HotelBeds
  module PurchaseCancel
    class Response < HotelBeds::Action::Response
      def purchase
        HotelBeds::Parser::HotelPurchase.new(body.at_css("Purchase")).to_model
      end
    end
  end
end
