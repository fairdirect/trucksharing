module Api
  module V1
    module Recipients
      class ShippingEnquiriesController < Api::V1::RecipientsController
        def create
          render json: { data: {} }, status: :created
        end

        private

      end
    end
  end
end
