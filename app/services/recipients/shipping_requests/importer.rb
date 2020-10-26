module Recipients
  module ShippingRequests
    class Importer
      DEFAULT_FROM_DAYS = 14.freeze

      def initialize(order_scope: ::Marketplace::Order,
                     repository: ::Logistics::ShippingRequest,
                     attributes_factory: ShippingRequests::AttributesFactory.new,
                     geocode_service: ShippingRequests::OpenStreetMap::Service.new,
                     route_service: ShippingRequests::GraphHopper::Service.new)
        @order_scope = order_scope
        @repository = repository
        @attributes_factory = attributes_factory
        @geocode_service = geocode_service
        @route_service = route_service
      end

      def orders_for_import_count(recipient, from: DEFAULT_FROM_DAYS.days.ago, to: Time.zone.now)
        orders_to_import(recipient.id, last_import_date(recipient, from)..to).count
      end

      def import(recipient, from: DEFAULT_FROM_DAYS.days.ago, to: Time.zone.now)
        imported_orders = orders_to_import(recipient.id, last_import_date(recipient, from)..to)
        import_from_orders(imported_orders)
      end

      def import_for_order_number(order)
        create_shipping_request(order)
      end

      private

      attr_reader :order_scope, :repository, :attributes_factory, :geocode_service, :route_service

      def import_from_orders(orders)
        orders.map { |order| create_shipping_request(order) }
      end

      def create_shipping_request(order)
         delivery_coordinates = geocode_service.find!(order.delivery_address_text)
         pickup_coordinates = geocode_service.find!(order.pickup_address_text)
         paths = route_service.route(pickup_coordinates.to_params, delivery_coordinates.to_params)
         repository.create!(build_shipping_request(order, delivery_coordinates, pickup_coordinates, paths.top_path))
      end

      def build_shipping_request(order, delivery_coordinates, pickup_coordinates, path)
        attributes_factory.build_from_order(order, delivery_coordinates, pickup_coordinates, path)
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

