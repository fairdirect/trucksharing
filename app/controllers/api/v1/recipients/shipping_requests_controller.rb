require "recipients/shipping_requests/jsonapi_serializer"

module Api
  module V1
    module Recipients
      class ShippingRequestsController < Api::V1::RecipientsController
        def index
          render json: serialized_collection, status: :ok
        end

        private

        def serialized_collection
          options = { is_collection: true }
          options[:meta] = { total: query_response.total }
          ::Recipients::ShippingRequests::JsonapiSerializer.new(query_response.hits, options).serializable_hash
        end

        def query_response
          @query_response ||= repository.fetch(user_id: recipient.id)
        end

        def repository
          @repository ||= ::Recipients::ShippingRequests::MockedRepository.new
        end
      end
    end
  end
end
