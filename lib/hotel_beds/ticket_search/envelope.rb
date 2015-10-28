require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"
require "hotel_beds/model/destination"
require "hotel_beds/model/contract"

module HotelBeds
  module TicketSearch
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@sessionId => session_id,
          :PaginationData => pagination_data,
          :Language => language,
          :DateFrom => date_from,
          :DateTo => date_to,
          :ServiceOccupancy => occupancy,
          :Destination => destination
        }.merge(Hash(extra_params))
      end

      private

      def extra_params
        { ExtraParamList: {
          ExtendedData: []
          }
        }
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

      def date_from
        { :@date => __getobj__.date_from.strftime("%Y%m%d") }
      end

      def date_to
        { :@date => __getobj__.date_to.strftime("%Y%m%d") }
      end

      def destination
        {
          # :@code => String(__getobj__.destination).upcase,
          :@code => "PMI",
          :@type => "SIMPLE"
        }
      end

      def occupancy
        {
          # :@adult_count => Integer(__getobj__.service_occupancy.first.adult_count),
          :@adult_count => 1,
          # :@child_count => Integer(__getobj__.service_occupancy.first.child_count)
          :@child_count => 0
        }
      end

    end
  end
end
