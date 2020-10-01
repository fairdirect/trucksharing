module Recipients
  module ShippingRequests
    class Service
      def initialize(
        user_repository: ::Users::Authentication::MockedUserRepository.new,
        shipping_request_repository: ::Logistics::ShippingRequest
      )
        @user_repository = user_repository
        @shipping_request_repository = shipping_request_repository
      end

      def enquire(recipient, shipping_request_id, service_provider_id, enquiries_repo: ::Logistics::ShippingEnquiry)
        enquiries_repo.create(
          service_provider_id: service_provider(service_provider_id).id,
          shipping_request_id: shipping_request(recipient, shipping_request_id).id
        )
      end

      private

      attr_reader :user_repository, :shipping_request_repository

      def service_provider(service_provider_id)
        user_repository.find_service_provider(id: service_provider_id)
      end

      def shipping_request(recipient, shipping_request_id)
        shipping_request_repository.find_by!(user_id: recipient.id, id: shipping_request_id)
      end
    end
  end
end
