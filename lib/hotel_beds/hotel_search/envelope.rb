require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module HotelSearch
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@sessionId => session_id,
          :PaginationData => pagination_data,
          :Language => language,
          :CheckInDate => check_in_date,
          :CheckOutDate => check_out_date,
          :OccupancyList => occupancy_list
        }.merge(Hash(destination)).merge(Hash(hotels)).merge(Hash(extra_params))
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
            :Value => __getobj__.order
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

      def check_in_date
        { :@date => __getobj__.check_in_date.strftime("%Y%m%d") }
      end

      def check_out_date
        { :@date => __getobj__.check_out_date.strftime("%Y%m%d") }
      end

      def destination
        { Destination: {
          :@code => String(__getobj__.destination_code).upcase,
          :@type => "SIMPLE"
        } }
      end

      def hotels
        if Array(__getobj__.hotel_codes).any?
          { HotelCodeList: {
            :@withinResults => "Y",
            :ProductCode => Array(__getobj__.hotel_codes)
          } }
        end
      end

      def occupancy_list
        grouped_rooms = Array(rooms).group_by(&:group_key).values
        { HotelOccupancy: grouped_rooms.map(&method(:build_room)) }
      end

      def build_room(rooms)
        HotelBeds::Builder::HotelOccupancy.new(rooms).to_h
      end
    end
  end
end
