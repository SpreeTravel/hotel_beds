require "hotel_beds/action/operation"
require_relative "envelope"
require_relative "request"
require_relative "response"

module HotelBeds
  module TransferBasketAdd
    class Operation < HotelBeds::Action::Operation
      remote_method :serviceAdd
      remote_namespace :ServiceAddRQ
      envelope_class Envelope
      request_class Request
      response_class Response
    end
  end
end
