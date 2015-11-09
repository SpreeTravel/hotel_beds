require "hotel_beds/action/envelope"

module HotelBeds
  module TicketDetail
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@availToken => avail_token,
          :@version => "2013/12",
          :Language => language,
          :TicketCode  => code,
          :Contract => {
            :Name => String(contract_name),
            :IncomingOffice => {
              :@code => Integer(contract_code)
            }
          }
        }
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
