module Users
  module Authentication
    class MockedUser
      RECIPIENT_ROLE_NAME = "recipient"
      SERVICE_PROVIDER_ROLE_NAME = "service_provider"

      def initialize(token: "2e48afa0-ad6b-424b-b216-6ed41213d98a", id: 1, role: RECIPIENT_ROLE_NAME)
        @id = 1
        @token = token
        @role = role
      end

      attr_reader :token, :id, :role

      def recipient?
        role == RECIPIENT_ROLE_NAME
      end

      def service_provider?
        role == SERVICE_PROVIDER_ROLE_NAME
      end
    end
  end
end
