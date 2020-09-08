module Api
  module V1
    module Recipients
      class ShippingRequestsController < Api::V1::RecipientsController
        def index
          render json: { data: [] }, status: :ok
        end
      end
    end
  end
end
