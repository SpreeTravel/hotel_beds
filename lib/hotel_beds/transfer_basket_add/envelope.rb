require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module TransferBasketAdd
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          Language: language,
          Service: {
            :"@xsi:type" => "ServiceTransfer",
            :"@transferType" => service.transfer_type,
            :"@availToken" => service.token,
            ContractList: contract,
            DateFrom: date_from,
            TransferInfo: transfer_info,
            Paxes: paxes,
            PickupLocation: {
              '@xsi:type'=> 'ProductTransferTerminal',
              Code: __getobj__.pickup_location,
              DateTime: service_date(__getobj__.service_date.first.date )
            },
            DestinationLocation: {
              '@xsi:type'=>'ProductTransferHotel',
              Code: __getobj__.destination_location,
            }
          }
        }
      end

      private

      def contract
        {
          Contract: {
            Name: service.contract_name,
            IncomingOffice: { :@code => service.contract_incoming_office_code }
          }
        }
      end

      def date_from
        {
          :@date => service.date_from.strftime("%Y%m%d"),
          :@time => '1100'
        }
      end

      def transfer_info
        {
          Code: service.transfer_code,
          Type: {
            :@code => service.type
          },
          VehicleType: {
            :@code => service.vehicle_type
          }
        }
      end

      def paxes
        {
          AdultCount: service.occupancy.adult_count,
          ChildCount: service.occupancy.child_count,
          GuestList: 1.upto(service.occupancy.child_count).map { |i|
            {
              Customer: {
                :@type => "CH",
                :Age => Integer(service.occupancy.child_ages.fetch(i - 1))
              }
            }
          }
        }
      end

    end
  end
end
