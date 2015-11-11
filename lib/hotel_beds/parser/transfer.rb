require "hotel_beds/parser"
require "hotel_beds/parser/contract"
require "hotel_beds/parser/destination"
require "hotel_beds/parser/pickup_location"

module HotelBeds
  module Parser
    class Transfer
      include HotelBeds::Parser

      # attributes
      attribute :availability_token, attr: "availToken"
      attribute :transfer_type, attr: "transferType"

      attribute :contract, selector: "ContractList > Contract",
                parser: HotelBeds::Parser::Contract

      attribute :date_from, selector: "DateFrom", attr: "date"
      attribute :time_from, selector: "DateFrom", attr: "time"
      attribute :currency, selector: "Currency", attr: "code"
      attribute :total_amount, selector: "TotalAmount"
      attribute :net_price, selector: "NetPrice"

      attribute :code, selector: "TransferInfo > Code"
      attribute :type, selector: "TransferInfo > Type"
      attribute :type_code, selector: "TransferInfo > Type", attr: "code"
      attribute :vehicle_type, selector: "TransferInfo > VehicleType"
      attribute :vehicle_type_code, selector: "TransferInfo > VehicleType", attr: "code"
      attribute :description, selector: "TransferInfo > DescriptionList > Description", multiple: true
      attribute :images, selector: "TransferInfo > ImageList > Image > Url", multiple: true
      attribute :max_waiting, selector: "TransferInfo > TransferSpecificContent > MaximumWaitingTime", attr: "time"

      attribute :adult, selector: "Paxes > AdultCount"
      attribute :child, selector: "Paxes > ChildCount"

      attribute :pick_location_code, selector: "PickupLocation > Code"
      attribute :pick_location_type, selector: "PickupLocation", attr: "xsi:type"
      # attribute :pick_location, selector: "PickupLocation",
      #           parser: HotelBeds::Parser::PickupLocation
      attribute :dest_location_code, selector: "DestinationLocation > Code"
      attribute :dest_location_type, selector: "DestinationLocation", attr: "xsi:type"

      attribute :duration, selector: "EstimatedTransferDuration"

      attribute :vehicle_type, selector: "ProductSpecifications > MasterVehicleType", attr: "name"
      attribute :product_type, selector: "ProductSpecifications > MasterProductType", attr: "name"
      attribute :service_type, selector: "ProductSpecifications > MasterServiceType", attr: "name"
      attribute :product_specification,
                selector: "ProductSpecifications > TransferGeneralInfoList > TransferBulletPoint > Description",
                multiple: true

    end
  end
end
