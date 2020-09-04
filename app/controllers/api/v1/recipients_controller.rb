module Api
  module V1
    class RecipientsController < UsersController
      before_action :authorise_recipient!

      attr_reader :recipient

      def authorised
        render json: recipient
      end

      private
        def authorise_recipient!
          render status: :forbidden unless user.recipient?

          @recipient = user
        end
    end
  end
end

