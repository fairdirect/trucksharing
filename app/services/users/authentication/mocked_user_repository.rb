require_relative "mocked_user"

module Users
  module Authentication
    class MockedUserRepository
      RECIPIENT = MockedUser.new
      SERVICE_PROVIDER = MockedUser.new(id: 2, token: "793cc4bd-99cc-4a54-9cdc-2fb2865ee90a", role: MockedUser::SERVICE_PROVIDER_ROLE_NAME)
      USERS = [RECIPIENT, SERVICE_PROVIDER]

      def find(token:)
        USERS.find { |user| user.token == token }
      end
    end
  end
end
