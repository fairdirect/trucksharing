module Recipients
  module ShippingRequests
    class Importer
      DEFAULT_FROM_DAYS = 14.freeze

      def initialize(order_scope: ::Marketplace::Order,
                     shipping_request_repo: ::Logistics::ShippingRequest)
        @order_scope = order_scope
        @shipping_request_repo = shipping_request_repo
      end

      def import(recipient, from: DEFAULT_FROM_DAYS.days.ago, to: Time.zone.now)
        imported_orders = orders_to_import(recipient.id, last_import_date(recipient, from)..to)

        return 0 if imported_orders.empty?

        imported_orders.map do |imp_ord|
          build_shipping_request_from(recipient, imp_ord).save!
        end

        imported_orders.count
      end

      private

      attr_reader :order_scope, :shipping_request_repo

      def last_import_date(recipient, from)
        [
          shipping_request_repo.last_import_date_for(recipient),
          from
        ].compact
          .max + 1.day
      end

      def build_shipping_request_from(recipient, imported_order)
        creation_date = Time.zone.now
        shipping_request_repo.new(
          {
            user_id: recipient.id,
            order_number: imported_order.order_number,
            donation_date: imported_order.created,
            delivery_deadline: imported_order.created + DEFAULT_FROM_DAYS.days,
            created_at: creation_date,
            updated_at: creation_date
          }.merge(
            build_delivery_address(imported_order.delivery_addr)
          ).merge(
            build_pickup_address(imported_order.shop)
          )
        )
      end

      def build_pickup_address(shop)
        {
          pickup_firstname: "",
          pickup_name: "",
          pickup_city: shop.city,
          pickup_company_name: shop.company,
          pickup_country: shop.country,
          pickup_house: shop.house,
          pickup_street: shop.street,
          pickup_zip: shop.zip
        }
      end

      def build_delivery_address(delivery_address)
        {
          delivery_firstname: "",
          delivery_name: "",
          delivery_city: delivery_address.city,
          delivery_company_name: delivery_address.company,
          delivery_country: delivery_address.country,
          delivery_house: delivery_address.house,
          delivery_street: delivery_address.street,
          delivery_zip: delivery_address.zip
        }
      end

      def orders_to_import(recipient_id, range)
        order_scope.where(user_id: recipient_id, created: range)
      end
    end
  end
end

