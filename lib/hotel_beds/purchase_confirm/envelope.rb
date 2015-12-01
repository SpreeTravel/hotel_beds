require "hotel_beds/action/envelope"

module HotelBeds
  module PurchaseConfirm
    class Envelope < HotelBeds::Action::Envelope
      def attributes
        {
          Language: language,
          ConfirmationData: {
            :"@purchaseToken" => purchase.token,
            :Holder => customer(purchase.holder),
            :AgencyReference => purchase.agency_reference,
            :ConfirmationServiceDataList => {
              :ServiceData => purchase.services.map(&method(:service_data))
            }
          }
        }
      end

      private
      def service_data(service)
        {
          :@SPUI => service.id,
          :"@xsi:type" => service.type,
          :CustomerList => {
            :Customer => service.customers.map(&method(:customer))
          }
        }
      end

      def customer(customer)
        puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        puts customer.inspect
        {
          :@type => (:child == customer.type ? "CH" : "AD"),
          :CustomerId => customer.id,
          :Age => customer.age,
          :Name => customer.name,
          :LastName => customer.last_name,
        }
      end
    end
  end
end
