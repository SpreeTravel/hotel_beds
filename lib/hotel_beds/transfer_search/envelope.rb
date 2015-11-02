require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module TransferSearch
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@sessionId => session_id,
          :@version => "2013/12",
          :Language => language,
          :ReturnContents => return_contents,
          :AvailData => {
            :@type => 'IN',
            :ServiceDate => service_date,
            :Occupancy => occupancy,
            :PickupLocation =>  pickup_location,
            :DestinationLocation => destination_location
          }
        }
      end

      private

      def service_date
        {
          :@date =>  Integer(__getobj__.service_date.first.date.strftime("%Y%m%d")) ,
          :@time => '1100'
        }
      end

      def language
        String(__getobj__.language).upcase
      end

      def pickup_location
        {
          '@xsi:type'=>"ProductTransferTerminal",
          :Code => String(__getobj__.pickup_location).upcase,
          :DateTime => {
            :@date => Integer(__getobj__.service_date.first.date.strftime("%Y%m%d")) ,
            :@time => '1100'
          }
        }

      end

      def destination_location
        {
          '@xsi:type'=>"ProductTransferHotel",
          :Code => Integer(__getobj__.destination_location)
        }
      end

      def occupancy
        # TODO Add Gest list for child ages
        # <GuestList>
        #   <Customer type="CH">
        #     <Age>6</Age>
        #   </Customer>
        # </GuestList>
        {
          :AdultCount => Integer(__getobj__.occupancy.first.adult_count),
          :ChildCount => Integer(__getobj__.occupancy.first.child_count)
        }
      end

      def return_contents
        String(__getobj__.return_contents).upcase
      end
    end
  end
end
