require "hotel_beds/parser"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/image"
require "hotel_beds/parser/product_feature"
require "hotel_beds/parser/product_room"

module HotelBeds
  module Parser
    class TicketDetail
      include HotelBeds::Parser

      # attributes
      attribute :code, selector: "Ticket > Code"
      attribute :name, selector: "Ticket > Name"
      attribute :description, selector: "Ticket > DescriptionList > Description"
      attribute :images, selector: "Ticket > ImageList > Image", multiple: true,
                 parser: HotelBeds::Parser::Image
      attribute :feature_name, selector: "Ticket > TicketFeature > Name"


      # attribute :features, selector: "Hotel > FacilityList > Feature", multiple: true,
      #           parser: HotelBeds::Parser::ProductFeature
      #
      #
      # attribute :stars, selector: "Hotel > Category", attr: "shortname"
      # attribute :destination, selector: "Hotel > Destination",
      #           parser: HotelBeds::Parser::Destination
      # attribute :longitude, selector: "Position", attr: "longitude"
      # attribute :latitude, selector: "Position", attr: "latitude"
      # attribute :chain, selector: "Chain"
      # attribute :product_rooms, selector: "Hotel > ProductRoomList > ProductRoom" ,  multiple: true,
      #           parser: HotelBeds::Parser::ProductRoom


    end
  end
end
