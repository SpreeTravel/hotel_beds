require "hotel_beds/parser"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/available_modality"

module HotelBeds
  module Parser
    class Ticket
      include HotelBeds::Parser

      # attributes
      attribute :availability_token, attr: "availToken"

      attribute :date_from, selector: "DateFrom", attr: "date"
      attribute :date_to, selector: "DateTo", attr: "date"
      attribute :currency, selector: "Currency"
      attribute :currency_code, selector: "Currency", attr: "code"
      
      attribute :code, selector: "TicketInfo > Code"
      attribute :name, selector: "TicketInfo > Name"
      attribute :description, selector: "TicketInfo > DescriptionList > Description"
      attribute :images, selector: "TicketInfo > ImageList > Image > Url",
        multiple: true
      attribute :company_code, selector: "TicketInfo > CompanyCode"
      attribute :ticket_class, selector: "TicketInfo > TicketClass"
      attribute :destination, selector: "TicketInfo > Destination",
                parser:HotelBeds::Parser::Destination

      attribute :zone, attr: "TicketInfo > TicketZone"

      attribute :available_modality, selector: "AvailableModality", multiple: true,
                parser: HotelBeds::Parser::AvailableModality

      attribute :adult_count, selector: "Paxes > AdultCount"
      attribute :child_count, selector: "Paxes > ChildCount"

    end
  end
end
