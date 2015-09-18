require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module TransferSearch
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@sessionId => session_id,
          :PaginationData => pagination_data,
          :Language => language,
          :DateFrom => date_in,
          :DateOut => date_out,
          :Occupancy => occupancy,
          :PickupLocation => pickup_location,
          :DestinationLocation => destination_location,
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

      def pagination_data
        {
          :@pageNumber => Integer(page_number),
          :@itemsPerPage => Integer(items_per_page)
        }
      end

      def language
        String(__getobj__.language).upcase
      end

      def date_in
        { :@date => __getobj__.date_in.strftime("%Y%m%d") }
      end

      def date_out
        { :@date => __getobj__.date_out.strftime("%Y%m%d") }
      end

      def pickup_location
        { PickupLocation: {
            :@code => String(__getobj__.pickup_location.first.code).upcase,
            # :@datetime => __getobj__.pickup_location.first.datetime.strftime("%Y%m%d")
        }
        }

      end

      def destination_location
        {
            DestinationLocation: {
            :@code => String(__getobj__.destination_location.first.code).upcase,
            # :@transfer_zone => String(__getobj__.transfer_zone.code).upcase

            }
        }
      end

      def occupancy
        {
          Occupancy:{
            :@adult_count => Integer(__getobj__.adult_count),
            :@child_count => Integer(__getobj__.child_count)
          }

        }

      end

    end
  end
end
