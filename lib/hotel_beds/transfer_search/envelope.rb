require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module TransferSearch
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@sessionId => session_id,
          :ServiceDate => service_date,
          :Language => language,
          :Occupancy => occupancy,
          :PickupLocation => pickup_location,
          :DestinationLocation => destination_location,
          :ReturnContents => return_contents
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
            ServiceDate:{
                :@date => Date(__getobj__.service_date.first.date),
                :@time => Time(__getobj__.service_date.first.time)
            }

        }
      end

      def language
        String(__getobj__.language).upcase
      end

      def pickup_location
        { PickupLocation: {
            :@code => String(__getobj__.pickup_location.first.code).upcase,
            :@datetime => __getobj__.pickup_location.first.datetime.strftime("%Y%m%d"),
            :@transfer_zone_code => transfer_zone
        }
        }

      end

      def destination_location
        { DestinationLocation:{
            :@code => String(__getobj__.destination_location.first.code).upcase,
            :@datetime => __getobj__.destination_location.first.datetime.strftime("%Y%m%d"),
            :@transfer_zone_code => transfer_zone
        }
        }
      end

      def transfer_zone
        {
            TransferZone:
                {
                    :@code => Integer(__getobj__.transfer_zone.first.code)
                }
        }
      end

      def occupancy
        {
          Occupancy:{
            :@adult_count => Integer(__getobj__.occupancy.first.adult_count),
            :@child_count => Integer(__getobj__.occupancy.first.child_count)
          }

        }
      end

      def return_contents
        String(__getobj__.return_contents).upcase
      end
    end
  end
end
