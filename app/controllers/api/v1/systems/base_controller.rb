module Api
  module V1
    module Systems
      class BaseController < ApplicationController
        class NoAuthenticationHeaderError < StandardError; end
        class KeyNotFoundError < StandardError; end

        before_action :authenticate_api_key!

        def ping
          render status: 200
        end

        private

        def authenticate_api_key!
          Logistics::ApiKey.active.find_by!(key: request_api_key)
        rescue NoAuthenticationHeaderError, ActiveRecord::RecordNotFound
          render status: :unauthorized
        end

        def request_api_key
          raise NoAuthenticationHeaderError if request_headers["Api-Key"].nil?
          request_headers["Api-Key"].split(' ').last
        end

        def api_key
          @api_key
        end
      end
    end
  end
end

