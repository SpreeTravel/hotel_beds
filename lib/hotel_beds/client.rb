require "hotel_beds/configuration"
require "hotel_beds/connection"
require "hotel_beds/hotel_search/operation"
require "hotel_beds/ticket/operation"
require "hotel_beds/hotel_basket_add/operation"
require "hotel_beds/purchase_confirm/operation"
require "hotel_beds/purchase_cancel/operation"
require "hotel_beds/purchase_flush/operation"
require "hotel_beds/basket_remove/operation"

module HotelBeds
  class Client
    attr_accessor :configuration, :connection
    private :configuration=, :connection, :connection=

    def initialize(**config)
      self.configuration = Configuration.new(**config)
      self.connection = Connection.new(configuration)
      freeze
    end

    # each method returns an operation object which contains both the
    # request and response objects.

    def perform_hotel_search(*args)
      HotelSearch::Operation.new(*args).perform(
        connection: connection
      )
    end

    def perform_ticket_search(*args)
      Ticket::Operation.new(*args).perform(
        connection: connection
      )
    end

    def perform_transfer_search(*args)
      Transfer::Operation.new(*args).perform(
          connection: connection
      )
    end

    def add_hotel_room_to_basket(*args)
      HotelBasketAdd::Operation.new(*args).perform(
        connection: connection
      )
    end

    def confirm_purchase(*args)
      PurchaseConfirm::Operation.new(*args).perform(
        connection: connection
      )
    end

    def flush_purchase(*args)
      PurchaseFlush::Operation.new(*args).perform(
        connection: connection
      )
    end

    def remove_service_from_basket(*args)
      BasketRemove::Operation.new(*args).perform(
        connection: connection
      )
    end

    def cancel_purchase(*args)
      PurchaseCancel::Operation.new(*args).perform(
        connection: connection
      )
    end

  end
end
