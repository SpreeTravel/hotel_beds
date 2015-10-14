require "hotel_beds/parser"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/image"
require "hotel_beds/parser/product_feature"
require "hotel_beds/parser/product_room"

module HotelBeds
  module Parser
    class HotelDetail
      include HotelBeds::Parser

      # attributes
      attribute :code, selector: "Hotel > Code"
      attribute :name, selector: "Hotel > Name"
      attribute :description, selector: "Hotel > DescriptionList > Description"
      # attribute :images, selector: "Hotel > ImageList > Image" ,  multiple: true,
      #           parser: HotelBeds::Parser::Image
      attribute :images, selector: "Hotel > ImageList > Image", multiple: true,
                 parser: HotelBeds::Parser::Image
      attribute :features, selector: "Hotel > FacilityList > Feature", multiple: true,
                 parser: HotelBeds::Parser::ProductFeature
      attribute :stars, selector: "Hotel > Category", attr: "shortname"
      attribute :destination, selector: "Hotel > Destination",
                parser: HotelBeds::Parser::Destination
      attribute :longitude, selector: "Position", attr: "longitude"
      attribute :latitude, selector: "Position", attr: "latitude"
      attribute :chain, selector: "Chain"
      attribute :product_rooms, selector: "Hotel > ProductRoomList > ProductRoom" ,  multiple: true,
                parser: HotelBeds::Parser::ProductRoom


    end
  end
end
