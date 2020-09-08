require "open_food_bank/recipients/shipping_requests/jsonapi_serializer"

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
          OpenFoodBank::Recipients::ShippingRequests::JsonapiSerializer.new(query_response.hits, options).serializable_hash
        end

        def query_response
          @query_response ||= query_service.fetch(user_id: recipient.id)
        end

        def query_service
          @query_service ||= OpenFoodBank::Recipients::ShippingRequests::QueryService.new(repository: repository)
        end

        def repository
          @repository ||= OpenFoodBank::Recipients::ShippingRequests::MockedRepository.new
        end
      end
    end
  end
end
