require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module TransferSearch
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@sessionId => session_id,
          :Language => language,
          :ReturnContents => return_contents,
          AvailData: {
            :@type => 'IN',
            :ServiceDate => service_date,
            :Occupancy => occupancy,
            :PickupLocation =>  {
              '@xsi:type'=>"ProductTransferTerminal",
              :@code => 'JFK',
              :DateTime => {
                :@date => '20151226',
                :@time => '1100'
              }
            },
            :DestinationLocation => {
              '@xsi:type'=>"ProductTransferHotel",
              :@code => 13388,

            },
          }
        }
      end

        private
      def extra_params
        { ExtraParamList: {
          ExtendedData: [{
           :@type => "EXT_ADDITIONAL_PARAM",
           :Name => "PARAM_KEY_PRICE_BREAKDOWN",
           :Value => "Y"
        }, {
           :@type => "EXT_ORDER",
           :Name => "ORDER_CONTRACT_PRICE",
           :Value => "ASC"
        }]
      } }
    end

      def service_date
        {
          :@date =>  '20151226' ,
          :@time => '1000'
        }
      end

      def language
        String(__getobj__.language).upcase
      end

      def pickup_location
        { PickupLocation:  {
            '@xsi:type'=>"ProductTransferHotel",
            :@code => String(__getobj__.pickup_location).upcase,
            # TransferZone: {
            #   '@xsi:type'=>"ProductZone",
            #   :@code => 'MAN',
            #   :@name => 'Can Pastilla'
            # }
          }
        }

      end

      def destination_location
        { DestinationLocation: {
            '@xsi:type'=>"ProductTransferTerminal",
            :@code => String(__getobj__.destination_location).upcase,
          # TransferZone: {
          #   '@xsi:type'=>"ProductZone",
          #   :@code => 'JFK',
          #   :@name => 'Palma Majorca, Son Sant Joan Airport'
          #   }
          }
        }
      end

      def occupancy
        {
          :@adult_count => Integer(__getobj__.occupancy.first.adult_count),
          # :@child_count => Integer(__getobj__.occupancy.first.child_count)
          GuestList: {
            Customer: {
              :@type => 'AD'
            }
          }
        }
      end

      def return_contents
        String(__getobj__.return_contents).upcase
      end
    end
  end
end
