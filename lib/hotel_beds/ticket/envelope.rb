require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"
require "hotel_beds/model/destination"
require "hotel_beds/model/contract"

module HotelBeds
  module Ticket
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@sessionId => session_id,
          :PaginationData => pagination_data,
          :ServiceOccupancy => service_occupancy,
          :Language => language,
          :DateFrom => date_from,
          :DateTo => date_to,
          :Classification => classification,
          :TicketZone => ticket_zone,
          :Contract => HotelBeds::Model::Contract, ## Agregar validate del 1 a 10
          :TicketCode => ticket_code,
          :ModalityCode => modality_code, ## Agregar validate del 1 al 13
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

      def date_from
        { :@date => __getobj__.date_from.strftime("%Y%m%d") }
      end

      def date_to
        { :@date => __getobj__.date_to.strftime("%Y%m%d") }
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
    end
  end
end
