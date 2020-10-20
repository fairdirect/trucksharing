module Recipients
  module ShippingRequests
    class AttributesFactory
      DEFAULT_FROM_DAYS_NUMBER = 14

      def build_from_order(ord, delivery_coordinates, pickup_coordinates)
        creation_date = Time.zone.now
        {
          user_id: ord.user_id,
          order_number: ord.order_number,
          donation_date: ord.created,
          delivery_deadline: ord.created + DEFAULT_FROM_DAYS_NUMBER.days,
          created_at: creation_date,
          updated_at: creation_date,
          delivery_lat: delivery_coordinates.latitude,
          delivery_lng: delivery_coordinates.longitude,
          pickup_lat: pickup_coordinates.latitude,
          pickup_lng: pickup_coordinates.longitude,
        }.merge(
          build_delivery_address(ord.delivery_addr)
        ).merge(
          build_pickup_address(ord.shop)
        )
      end

      private

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
    end
  end
end

