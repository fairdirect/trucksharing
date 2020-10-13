module Api
  module V1
    module Recipients
      class ShippingEnquiriesController < Api::V1::Recipients::BaseController
        before_action :validate_new_enquiry_params, only: :create

        def create
          sh_en = shipping_requests_service.enquire(recipient, shipping_request_id, service_provider_id)
          render json: serialized_item(sh_en), status: :created
        rescue ActiveRecord::RecordNotFound
          render status: :not_found
        end

        private

        def shipping_request_id
          new_enquiry_params[:shipping_request_id].to_i
        end

        def service_provider_id
          new_enquiry_params[:service_provider_id].to_i
        end

        def validate_new_enquiry_params
          render status: :bad_request unless new_enquiry_params.keys.sort == ["service_provider_id", "shipping_request_id"].sort
        end

        def new_enquiry_params
          params.require(:shipping_enquiry).permit(:shipping_request_id, :service_provider_id)
        end

        def shipping_requests_service
          @shipping_requests_service ||= ::Recipients::ShippingRequests::Service.new
        end

        def serialized_item(shipping_enquiry)
          ::Recipients::ShippingEnquiries::JsonapiSerializer.new(shipping_enquiry).serializable_hash
        end
      end
    end
  end
end
