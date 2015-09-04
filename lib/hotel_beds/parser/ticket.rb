require "hotel_beds/parser"
require "hotel_beds/parser/contract"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/available_modality"

module HotelBeds
  module Parser
    class Ticket
      include HotelBeds::Parser

      # attributes
      attribute :code, selector: "TicketInfo > Code"
      attribute :availability_token, attr: "availToken"
      attribute :name, selector: "TicketInfo > Name"
      attribute :description, selector: "TicketInfo > DescriptionList > Description"
      attribute :images, selector: "TicketInfo > ImageList > Image > Url",
        multiple: true
      attribute :ticket_zone, attr: "TicketInfo > TicketZone"
      attribute :destination, selector: "TicketInfo > Destination",
        parser: HotelBeds::Parser::Destination
      attribute :available_modality, selector: "AvailableModality", multiple: true,
        parser: HotelBeds::Parser::AvailableModality ## Agregar un parser para este
    end
  end
end
