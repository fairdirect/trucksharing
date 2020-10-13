module Api
  module V1
    module ServiceProviders
      class BaseController < UsersController
        before_action :authorise_service_provider!

        attr_reader :service_provider

        def authorised
          render json: service_provider
        end

        private
          def authorise_service_provider!
            render status: :forbidden unless user.service_provider?

            @service_provider = user
          end
      end
    end
  end
end

