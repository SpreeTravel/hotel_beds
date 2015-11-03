require "hotel_beds/parser"
require "hotel_beds/parser/contract"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/transferbullet_point"

module HotelBeds
  module Parser
    class Transfer
      include HotelBeds::Parser

      # attributes
      attribute :code, selector: "TransferInfo > Code"
      attribute :availability_token, attr: "availToken"
      attribute :transfer_type, attr: "transferType"
      attribute :date_from, selector: "DateFrom"
      attribute :currency, selector: "Currency"
      attribute :total_amount, selector: "TotalAmount"
      attribute :net_price, selector: "NetPrice"
      attribute :description, selector: "TransferInfo > DescriptionList > Description",
        multiple: true
      attribute :images, selector: "TransferInfo > ImageList > Image > Url",
        multiple: true
      attribute :product_specification,
                selector: "ProductSpecifications > TransferGeneralInfoList > TransferBulletPoint > Description",
                multiple: true
      attribute :type, selector: "TransferInfo > Type"
      attribute :vehicle_type, selector: "TransferInfo > VehicleType"
      # attribute :maximum_waiting_time, attr: "TransferInfo > TransferSpecificContent > MaximumWaitingTime"
      # attribute :contract, selector: "ContractList > Contract",
      #           parser: HotelBeds::Parser::Contract
      # attribute :transferbullet_point, selector: "TransferInfo > TransferSpecificContent > GenericTransferGuidelinesList > TransferBulletPoint",
      #           parser: HotelBeds::Parser::TransferBulletPoint

    end
  end
end
