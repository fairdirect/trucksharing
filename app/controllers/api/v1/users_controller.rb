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
          @user = ::Marketplace::User.find_by_token!(http_auth_header)
        rescue ActiveRecord::RecordNotFound
          render status: :unauthorized
        end
    end
  end
end
