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
                }.merge(Hash(pickup_location)).merge(Hash(destination_location))
        }.merge(Hash(extra_params))
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
          :@date =>  __getobj__.service_date.first.date.strftime("%Y%m%d") ,
          :@time =>  __getobj__.service_date.first.time
        }
      end

      def language
        String(__getobj__.language).upcase
      end

      def pickup_location
        { PickupLocation:  {
            '@xsi:type'=>"ProductTransferHotel",
            :@code => String(__getobj__.pickup_location).upcase,
            TransferZone: {
              '@xsi:type'=>"ProductZone",
              :@code => 'MAN',
              :@name => 'Can Pastilla'
            }
          }
        }

      end

      def destination_location
        { DestinationLocation: {
            '@xsi:type'=>"ProductTransferTerminal",
            :@code => String(__getobj__.destination_location).upcase,
          TransferZone: {
            '@xsi:type'=>"ProductZone",
            :@code => 'JFK',
            :@name => 'Palma Majorca, Son Sant Joan Airport'
            }
          }
        }
      end

      def occupancy
        {
          :@adult_count => Integer(__getobj__.occupancy.first.adult_count),
          :@child_count => Integer(__getobj__.occupancy.first.child_count)
        }
      end

      def return_contents
        String(__getobj__.return_contents).upcase
      end
    end
  end
end
