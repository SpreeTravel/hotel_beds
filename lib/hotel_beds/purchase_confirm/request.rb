require "securerandom"
require "hotel_beds/action/request"
require "hotel_beds/model"
require "hotel_beds/model/customer"

module HotelBeds
  module PurchaseConfirm
    class Request < HotelBeds::Action::Request
      class Service
        include HotelBeds::Model

        # attributes
        attribute :id, String
        attribute :type, String
        attribute :customers, Array[HotelBeds::Model::Customer]

        # validation
        validates :customers, length: { minimum: 1 }
        validates :id, :type, presence: true
        validate do |service|
          unless service.customers.all?(&:valid?)
            service.errors.add(:customers, "are invalid")
          end
        end
      end

      class Purchase
        include HotelBeds::Model

        # attributes
        attribute :token, String
        attribute :holder, HotelBeds::Model::Customer
        attribute :agency_reference, String
        attribute :services, Array[Service]

        # validation
        validates :services, length: { minimum: 1 }
        validates :token, :agency_reference, :holder, presence: true
        validate do |purchase|
          purchase.services.each do |service|
            unless service.valid?
              service.errors.full_messages.each do |message|
                purchase.errors.add(:services, message)
              end
            end
          end
          if purchase.holder && purchase.holder.invalid?
            purchase.holder.errors.full_messages.each do |message|
              purchase.errors.add(:holder, message)
            end
          end
        end
      end

      # attributes
      attribute :purchase, Purchase

      # validation
      validates :purchase, presence: true
      validate do |request|
        if request.purchase && request.purchase.invalid?
          request.purchase.errors.full_messages.each do |message|
            request.errors.add(:purchase, message)
          end
        end
      end




    end
  end
end
