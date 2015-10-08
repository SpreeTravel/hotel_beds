require "hotel_beds/parser"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/image"
require "hotel_beds/parser/product_room"

module HotelBeds
  module Parser
    class HotelDetail
      include HotelBeds::Parser

      # attributes
      attribute :code, selector: "Hotel > Code"
      attribute :name, selector: "Hotel > Name"
      attribute :description, selector: "Hotel > DescriptionList >  Description"
      attribute :images, selector: "Hotel > ImageList > Image" ,  multiple: true,
                parser: HotelBeds::Parser::Image
      attribute :stars, selector: "Hotel > Category", attr: "shortname"
      attribute :destination, selector: "Hotel > Destination",
                parser: HotelBeds::Parser::Destination
      attribute :longitude, selector: "Position", attr: "longitude"
      attribute :latitude, selector: "Position", attr: "latitude"
      attribute :chain, selector: "Chain"
      attribute :product_rooms, selector: "Hotel > ProductRoomList > ProductRoom" ,  multiple: true,
                parser: HotelBeds::Parser::ProductRoom




      # attribute :address, selector: "Hotel > Contact > Address"
      # attribute :email, selector: "Hotel > Contact > EmailList > Email"
      # attribute :phone, selector: "Hotel > Contact > PhoneList > ContactNumber"
      # attribute :web, selector: "Hotel > Contact > WebList > Web"
      # attribute :availability_token, attr: "availToken"
      #
      # attribute :longitude, selector: "Position", attr: "longitude"
      # attribute :latitude, selector: "Position", attr: "latitude"
      # attribute :contract, selector: "ContractList > Contract",
      #   parser: HotelBeds::Parser::Contract
      # attribute :destination, selector: "HotelInfo > Destination",
      #   parser: HotelBeds::Parser::Destination
      # attribute :available_rooms, selector: "AvailableRoom", multiple: true,
      #   parser: HotelBeds::Parser::AvailableRoom
      # attribute :stars, selector: "HotelInfo > Category", attr: "shortname"
      # attribute :currency, selector: "Currency", attr: "code"
    end
  end
end
