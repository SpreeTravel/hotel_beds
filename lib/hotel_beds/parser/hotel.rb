require "hotel_beds/parser"
require "hotel_beds/parser/contract"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/available_room"

module HotelBeds
  module Parser
    class Hotel
      include HotelBeds::Parser

      # attributes
      attribute :code, selector: "HotelInfo > Code"
      attribute :availability_token, attr: "availToken"
      attribute :name, selector: "HotelInfo > Name"
      attribute :images, selector: "HotelInfo > ImageList > Image > Url",
        multiple: true
      attribute :longitude, selector: "Position", attr: "longitude"
      attribute :latitude, selector: "Position", attr: "latitude"
      attribute :contract, selector: "ContractList > Contract",
        parser: HotelBeds::Parser::Contract
      attribute :destination, selector: "HotelInfo > Destination",
        parser: HotelBeds::Parser::Destination
      attribute :available_rooms, selector: "AvailableRoom", multiple: true,
        parser: HotelBeds::Parser::AvailableRoom
      attribute :stars, selector: "HotelInfo > Category", attr: "shortname"
    end
  end
end
