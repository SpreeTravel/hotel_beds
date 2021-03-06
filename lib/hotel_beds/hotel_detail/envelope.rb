require "hotel_beds/action/envelope"

module HotelBeds
  module HotelDetail
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          # :@sessionId => session_id,
          :Language => language,
          :@version => "2013/12",
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
