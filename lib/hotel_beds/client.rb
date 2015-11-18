require "hotel_beds/configuration"
require "hotel_beds/connection"
require "hotel_beds/hotel_search/operation"
require "hotel_beds/hotel_detail/operation"
require "hotel_beds/hotel_basket_add/operation"

require "hotel_beds/ticket_search/operation"
require "hotel_beds/ticket_detail/operation"
require "hotel_beds/ticket_basket_add/operation"

require "hotel_beds/transfer_search/operation"
require "hotel_beds/transfer_basket_add/operation"

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

    # HOTEL ####################################
    def perform_hotel_search(*args)
      HotelSearch::Operation.new(*args).perform(
        connection: connection
      )
    end

    def perform_hotel_detail(*args)
      HotelDetail::Operation.new(*args).perform(
        connection: connection
      )
    end

    def add_hotel_room_to_basket(*args)
      HotelBasketAdd::Operation.new(*args).perform(
        connection: connection
      )
    end
    # HOTEL ####################################

    # TICKET ###################################
    def perform_ticket_search(*args)
      TicketSearch::Operation.new(*args).perform(
        connection: connection
      )
    end

    def perform_ticket_detail(*args)
      TicketDetail::Operation.new(*args).perform(
        connection: connection
      )
    end

    def add_ticket_to_basket(*args)
      TicketBasketAdd::Operation.new(*args).perform(
        connection: connection
      )
    end
    # TICKET #####################################

    # TRANSFER ###################################
    def perform_transfer_search(*args)
      TransferSearch::Operation.new(*args).perform(
          connection: connection
      )
    end

    def add_transfer_to_basket(*args)
      TicketBasketAdd::Operation.new(*args).perform(
        connection: connection
      )
    end
    # TRANSFER ######################################

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
