require "hotel_beds/action/envelope"
require "hotel_beds/builder/hotel_occupancy"

module HotelBeds
  module HotelDetail
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          # :@sessionId => session_id,
          :Language => language,
          :HotelCode  => code
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

      def language
        String(__getobj__.language).upcase
      end

    end
  end
end
