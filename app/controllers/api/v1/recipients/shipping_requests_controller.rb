require "recipients/shipping_requests/jsonapi/serializer"

module Api
  module V1
    module Recipients
      class ShippingRequestsController < Api::V1::RecipientsController
        def index
          render json: serialized_collection, status: :ok
        end

        def show
          render json: serialized_item, status: :ok
        rescue ::Recipients::ShippingRequests::RecordNotFound
          render status: :not_found
        end

        private

        def serialized_collection
          options = { is_collection: true }
          options[:meta] = { total: query_response.total }
          ::Recipients::ShippingRequests::Jsonapi::Serializer.new(query_response.hits, options).serializable_hash
        end

        def serialized_item
          ::Recipients::ShippingRequests::Jsonapi::Serializer.new(shipping_request).serializable_hash
        end

        def shipping_request
          @shipping_request ||= repository.find(user_id: recipient.id, id: params[:id].to_i)
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
