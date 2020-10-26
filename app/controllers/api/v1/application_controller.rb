module Api
  module V1
    class ApplicationController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

      private

      def render_not_found_response(exception)
        render json: { error: exception.message }, status: :not_found
      end

      def request_headers
        request.headers
      end
    end
  end
end
