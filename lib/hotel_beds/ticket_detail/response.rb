require "hotel_beds/action/response"
require "hotel_beds/parser/ticket_detail"

module HotelBeds
  module TicketDetail
    class Response < HotelBeds::Action::Response
      def session_id
        request.session_id
      end

      def currency
        body.at_css("Currency").attr("code")
      end

      def ticket
        HotelBeds::Parser::TicketDetail.new(body.css("Ticket")).to_model
      end
    end
  end
end
