require "hotel_beds/parser"
require "hotel_beds/parser/contract"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/available_modality"
require "hotel_beds/parser/transferbullet_point"

module HotelBeds
  module Parser
    class Transfer
      include HotelBeds::Parser

      # attributes
      attribute :code, selector: "TransferInfo > Code"
      attribute :availability_token, attr: "availToken"
      attribute :transfer_type, attr: "transferType"
      attribute :date_from, attr: "DateFrom"
      attribute :currency, attr: "Currency"
      attribute :total_amount, attr: "TotalAmount"
      attribute :net_price, attr: "NetPrice"
      attribute :descriptions, selector: "TransferInfo > DescriptionList > Description",
        multiple: true
      attribute :images, selector: "TransferInfo > ImageList > Image > Url",
        multiple: true
      attribute :type, attr: "TransferInfo > Type"
      attribute :vehicle_type, attr: "TransferInfo > VehicleType"
      attribute :maximum_waiting_time, attr: "TransferInfo > TransferSpecificContent > MaximumWaitingTime"
      attribute :contract, selector: "ContractList > Contract",
                parser: HotelBeds::Parser::Contract
      attribute :transferbullet_point, selector: "TransferInfo > TransferSpecificContent > GenericTransferGuidelinesList > TransferBulletPoint",
                parser: HotelBeds::Parser::TransferBulletPoint
      attribute :destination, selector: "TicketInfo > Destination",
        parser: HotelBeds::Parser::Destination
      attribute :available_modality, selector: "AvailableModality", multiple: true,
        parser: HotelBeds::Parser::AvailableModality
    end
  end
end
