module Recipients
  module ShippingRequests
    class ImportJob < ApplicationJob
      queue_as :default

      def perform(recipient_id)
        recipient = ::Marketplace::User.find(recipient_id)
        importer.import(recipient)
      end

      private

      def importer
        @importer ||= ::Recipients::ShippingRequests::Importer.new
      end
    end
  end
end

