require "recipients/shipping_requests/jsonapi/serializer"

module Api
  module V1
    module Recipients
      class ShippingRequestsController < Api::V1::Recipients::BaseController
        def index
          render json: serialized_collection, status: :ok
        end

        def show
          render json: serialized_item, status: :ok
        rescue ActiveRecord::RecordNotFound
          render status: :not_found
        end

        def schedule_import
          imported_orders_count = importer.orders_for_import_count(recipient)
          import_shipping_request(recipient.id) if imported_orders_count.positive?
          render json: { shipping_requests_to_be_imported: imported_orders_count }, status: :ok
        end

        private

        def serialized_collection
          options = { is_collection: true }
          options[:meta] = { total: query_response.count }
          ::Recipients::ShippingRequests::Jsonapi::Serializer.new(query_response, options).serializable_hash
        end

        def serialized_item
          ::Recipients::ShippingRequests::Jsonapi::Serializer.new(shipping_request).serializable_hash
        end

        def shipping_request
          @shipping_request ||= ::Logistics::ShippingRequest.find_by!(user_id: recipient.id, id: params[:id].to_i)
        end

        def query_response
          @query_response ||= ::Logistics::ShippingRequest.where(user_id: recipient.id)
        end

        def import_shipping_request(recipient_id)
          ::Recipients::ShippingRequests::ImportJob.perform_later(recipient_id)
        end

        def importer
          @importer ||= ::Recipients::ShippingRequests::Importer.new
        end
      end
    end
  end
end
