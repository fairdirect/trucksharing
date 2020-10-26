module Api
  module V1
    class UsersController < ApplicationController
      class NoAuthenticationHeaderError < StandardError; end
      before_action :authenticate_user!

      attr_reader :user

      def profile
        render json: user
      end

      private

        def http_auth_header
          raise NoAuthenticationHeaderError if request_headers["Authorisation"].nil?
          request_headers["Authorisation"].split(' ').last
        end

        def authenticate_user!
          @user = authentication_strategy.authenticate(http_auth_header)
        rescue NoAuthenticationHeaderError, Users::Authentication::UnknownTokenError
          render status: :unauthorized
        end

        def authentication_strategy
          @authentication_strategy ||= Users::Authentication::MockedStrategy.new
        end
    end
  end
end
