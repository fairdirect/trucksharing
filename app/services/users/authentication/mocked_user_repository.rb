require_relative "mocked_user"

module Users
  module Authentication
    class MockedUserRepository
      RECIPIENT = MockedUser.new
      SERVICE_PROVIDER = MockedUser.new(id: 2, token: "793cc4bd-99cc-4a54-9cdc-2fb2865ee90a", role: MockedUser::SERVICE_PROVIDER_ROLE_NAME)
      USERS = [RECIPIENT, SERVICE_PROVIDER]

      def find_service_provider(id:)
        USERS.find { |user| user.id == id && user.role == MockedUser::SERVICE_PROVIDER_ROLE_NAME}
      end

      def find_by_token(token:)
        USERS.find { |user| user.token == token }
      end
    end
  end
end
