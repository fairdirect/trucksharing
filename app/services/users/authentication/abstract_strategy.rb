module Users
  module Authentication
    class UnknownTokenError < StandardError; end

    class AbstractStrategy
      def initialize(user_repository:)
        @user_repository = user_repository
      end

      attr_reader :user_repository

      def authenticate(token)
        raise NotImplementedError
      end
    end
  end
end
