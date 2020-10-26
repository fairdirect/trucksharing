module Api
  module V1
    module Systems
      class ShippingRequestsController < Api::V1::Systems::BaseController
        def import
          shipping_request = import_order(order)

          render json: { order_number: shipping_request.order_number }, status: 200
        end

        private

        def import_order(order_for_import)
          importer.import_for_order_number(order_for_import)
        end

        def importer
          @importer ||= ::Recipients::ShippingRequests::Importer.new
        end

        def order
          @order ||= ::Marketplace::Order.find_by!(order_number: order_number)
        end

        def order_number
          params[:order_number]
        end
      end
    end
  end
end

