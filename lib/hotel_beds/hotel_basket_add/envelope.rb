require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module HotelBasketAdd
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@version => "2013/12",
          Language: language,
          Service: {
            :"@xsi:type" => "ServiceHotel",
            :"@availToken" => service.availability_token,
            :ContractList => contract,
            :DateFrom => date_from,
            :DateTo => date_to,
            :HotelInfo => hotel_info,
            :AvailableRoom => available_rooms
          }
        }
      end

      private

      def contract
        {
          Contract:
          {
            Name: service.contract_name,
            IncomingOffice: { :@code => service.contract_incoming_office_code }
          }
        }
      end

      def date_from
        {
          :@date => service.check_in_date.strftime("%Y%m%d")
        }
      end

      def date_to
        {
          :@date => service.check_out_date.strftime("%Y%m%d")
        }
      end

      def hotel_info
        {
          Code: service.hotel_code,
          Destination: {
            :@code => service.destination_code,
            :@type => "SIMPLE"
          }
        }
      end

      def available_rooms
        Array(service.rooms).group_by(&:group_key).values.map do |rooms|
          {
            HotelOccupancy: build_room(rooms),
            HotelRoom: {
              Board: {
                :@code => rooms.first.board_code,
                :@type => "SIMPLE"
              },
              RoomType: {
                :@code => rooms.first.room_type_code,
                :@characteristic => rooms.first.room_type_characteristic,
                :@type => "SIMPLE"
              },
            }
          }
        end
      end

      def build_room(rooms)
        HotelBeds::Builder::HotelOccupancy.new(rooms).to_h
      end
    end
  end
end
