require "hotel_beds/parser"

module HotelBeds
  module Parser
    class PickupLocation
      include HotelBeds::Parser

      # attributes
      attribute :code, attr: "PickupLocation > Code"
      attribute :name, selector: "PickupLocation > Name"
      attribute :transferzone_code, selector: "PickupLocation > TransferZone > Code"
      attribute :terminal_type, selector: "PickupLocation > TerminalType"
    end
  end
end
