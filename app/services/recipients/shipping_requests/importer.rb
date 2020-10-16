module Recipients
  module ShippingRequests
    class Importer
      DEFAULT_FROM_DAYS = 14.freeze

      def initialize(order_scope: ::Marketplace::Order,
                     repository: ::Logistics::ShippingRequest,
                     attributes_factory: ::Recipients::ShippingRequests::AttributesFactory.new)
        @order_scope = order_scope
        @repository = repository
        @attributes_factory = attributes_factory
      end

      def orders_for_import_count(recipient, from: DEFAULT_FROM_DAYS.days.ago, to: Time.zone.now)
        orders_to_import(recipient.id, last_import_date(recipient, from)..to).count
      end

      def import(recipient, from: DEFAULT_FROM_DAYS.days.ago, to: Time.zone.now)
        imported_orders = orders_to_import(recipient.id, last_import_date(recipient, from)..to)

        return 0 if imported_orders.empty?

        import_from_orders(imported_orders)

        imported_orders.count
      end

      private

      attr_reader :order_scope, :repository, :attributes_factory

      def import_from_orders(orders)
        orders.map do |order|
          # GraphHopper:
          # - get the delivery address coordinates
          # - get the ship address coordinates
          # - calculate the length in kilometers
          repository.create!(attributes_factory.build_from_order(order))
          # get the products data and build necessary attributes for our database
        end
      end

      def last_import_date(recipient, from)
        [
          repository.last_import_date_for(recipient),
          from
        ].compact
          .max + 1.day
      end

      def orders_to_import(recipient_id, range)
        order_scope.joins(:delivery_addr, :shop).where(user_id: recipient_id, created: range)
      end
    end
  end
end

