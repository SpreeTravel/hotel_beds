require "hotel_beds/action/envelope"

module HotelBeds
  module TicketBasketAdd
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          :@version => "2013/12",
          Language: language,
          Service: {
            :"@xsi:type" => "ServiceTicket",
            :"@availToken" => service.token,
            ContractList: contract,
            DateFrom: date_from,
            DateTo: date_to,
            Currency: currency,
            TicketInfo: ticket_info,
            AvailableModality: available_modality,
            Paxes: paxes
          }
        }
      end

      private

      def contract
        {
          Contract: {
            Name: service.contract_name,
            IncomingOffice: { :@code => service.contract_incoming_office_code }
          }
        }
      end

      def date_from
        {
          :@date => service.date_from.strftime("%Y%m%d")
        }
      end

      def date_to
        {
          :@date => service.date_to.strftime("%Y%m%d")
        }
      end

      def currency
        {
          :@code => service.currency
        }
      end

      def ticket_info
        {
          :"@xsi:type" => "ProductTicket",
          Code: service.ticket_code,
          Destination: {
            :@code => service.destination.code,
            :@type => service.destination.type
          }
        }
      end

      def available_modality
        {
          :@code => service.available_modality,
          Name: service.available_modality,
          Contract: {
            Name: service.contract_name,
            IncomingOffice: { :@code => service.contract_incoming_office_code }
          }
        }
      end

      def paxes
        {
          AdultCount: service.occupancy.adult_count,
          ChildCount: service.occupancy.child_count,
          GuestList: 1.upto(service.occupancy.child_count).map { |i|
            {
              Customer: {
                :@type => "CH",
                :Age => Integer(service.occupancy.child_ages.fetch(i - 1))
              }
            }
          }
        }
      end

    end
  end
end
