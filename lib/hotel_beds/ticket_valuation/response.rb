require "hotel_beds/action/response"
require "hotel_beds/parser/ticket_valuation"

module HotelBeds
  module TicketValuation
    class Response < HotelBeds::Action::Response
      def session_id
        request.session_id
      end

      def currency
        body.at_css("Currency").attr("code")
      end

      def ticket
        HotelBeds::Parser::TicketValuation.new(body.css("ServiceTicket")).to_model
      end
    end
  end
end
