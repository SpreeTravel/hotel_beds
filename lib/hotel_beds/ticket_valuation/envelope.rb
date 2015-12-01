require "hotel_beds/action/envelope"

module HotelBeds
  module TicketValuation
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@version => "2013/12",
          Language: language,
          AvailToken: avail_token,
          ServiceOccupancy: occupancy,
          DateFrom: date_from,
          DateTo: date_to,
          ModalityCode: modality_code,
          TicketCode:ticket_code
        }
      end

      private

      def modality_code
         __getobj__.modality_code
      end

      def ticket_code
         __getobj__.ticket_code
      end

      def date_from
        { :@date => __getobj__.date_from.strftime("%Y%m%d") }
      end

      def date_to
        { :@date => __getobj__.date_to.strftime("%Y%m%d") }
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
