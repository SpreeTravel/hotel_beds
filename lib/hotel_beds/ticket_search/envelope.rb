require "hotel_beds/action/envelope"

module HotelBeds
  module TicketSearch
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@sessionId => session_id,
          :@version => "2013/12",
          Language: language,
          PaginationData: pagination_data,
          ServiceOccupancy: occupancy,
          Destination: destination,
          DateFrom: date_from,
          DateTo: date_to,
        }
      end

      private

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
          :@code => String(__getobj__.destination).upcase,
          :@type => "SIMPLE"
        }
      end

      def child_count
        __getobj__.service_occupancy.first.child_count
      end

      def child_ages
        __getobj__.service_occupancy.first.child_ages
      end


      def occupancy
        {
          AdultCount: Integer(__getobj__.service_occupancy.first.adult_count),
          ChildCount: Integer(child_count),
          GuestList: 1.upto(child_count).map { |i|
              {
                Customer: {
                  :@type => "CH",
                  :Age => Integer(child_ages.fetch(i - 1))
                }
              }
            }
          }
      end

    end
  end
end
