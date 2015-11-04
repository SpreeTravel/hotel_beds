require "hotel_beds/parser"
require "hotel_beds/parser/contract"
require "hotel_beds/parser/destination"

module HotelBeds
  module Parser
    class Transfer
      include HotelBeds::Parser

      # attributes
      attribute :availability_token, attr: "availToken"
      attribute :transfer_type, attr: "transferType"
      attribute :date_from, selector: "DateFrom"
      attribute :currency, selector: "Currency", attr: "code"
      attribute :total_amount, selector: "TotalAmount"
      attribute :duration, selector: "EstimatedTransferDuration"
      attribute :net_price, selector: "NetPrice"

      attribute :vehicle_type, selector: "ProductSpecifications > MasterVehicleType", attr: "name"
      attribute :product_type, selector: "ProductSpecifications > MasterProductType", attr: "name"
      attribute :service_type, selector: "ProductSpecifications > MasterServiceType", attr: "name"

      attribute :all, selector: 'TransferInfo'
      attribute :code, selector: "TransferInfo > Code"
      attribute :type, selector: "TransferInfo > Type", attr: "code"
      attribute :description, selector: "TransferInfo > DescriptionList > Description", multiple: true
      attribute :images, selector: "TransferInfo > ImageList > Image > Url", multiple: true

      attribute :product_specification,
                selector: "ProductSpecifications > TransferGeneralInfoList > TransferBulletPoint > Description",
                multiple: true

    end
  end
end
