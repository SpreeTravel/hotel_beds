require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module TransferSearch
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        puts avail_data.inspect
        {
          :@sessionId => session_id,
          :@version => "2013/12",
          :Language => language,
          :ReturnContents => return_contents,
        }.merge(Hash(avail_data))
      end

      private

      def service_date(date)
        {
          :@date =>  Integer(date.strftime("%Y%m%d")) ,
          :@time => '1100'
        }
      end

      def language
        String(__getobj__.language).upcase
      end

      def child_count
        __getobj__.occupancy.first.child_count
      end

      def child_ages
        __getobj__.occupancy.first.child_ages
      end

      def occupancy
        {
          :AdultCount => Integer(__getobj__.occupancy.first.adult_count),
          :ChildCount => Integer(child_count),
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

      def return_contents
        String(__getobj__.return_contents).upcase
      end

      def avail_data
        if __getobj__.avail_data_type.size == 2
          {
            AvailData: [
              {
                :@type => __getobj__.avail_data_type.first,
                ServiceDate: service_date(__getobj__.service_date.first.date ),
                Occupancy: occupancy,
                PickupLocation: {
                   '@xsi:type'=> 'ProductTransferTerminal',
                   Code: __getobj__.pickup_location,
                   DateTime: service_date(__getobj__.service_date.first.date )
                },
                DestinationLocation: {
                 '@xsi:type'=>'ProductTransferHotel',
                 Code: __getobj__.destination_location,
                }
              },
              {
                :@type => __getobj__.avail_data_type.last,
                ServiceDate: service_date(__getobj__.service_date.last.date),
                Occupancy: occupancy,
                PickupLocation: {
                 '@xsi:type'=>'ProductTransferHotel',
                 Code: __getobj__.destination_location,
                },
                DestinationLocation: {
                 '@xsi:type'=> 'ProductTransferTerminal',
                 Code: __getobj__.pickup_location,
                 DateTime: service_date(__getobj__.service_date.last.date )
                }
              }
            ]
          }
        else
          {
            AvailData: {
              :@type => __getobj__.avail_data_type.first,
              ServiceDate: service_date(__getobj__.service_date.first.date ),
              Occupancy: occupancy,
              PickupLocation: {
                '@xsi:type'=> 'ProductTransferTerminal',
                Code: __getobj__.pickup_location,
                DateTime: service_date(__getobj__.service_date.first.date )
              },
              DestinationLocation: {
                '@xsi:type'=>'ProductTransferHotel',
                Code: __getobj__.destination_location,
              }
            }
          }
        end

      end


    end
  end
end
