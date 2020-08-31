require_relative "mocked_user"

module OpenFoodBank
  module Users
    module Authentication
      class MockedUserRepository
        USERS = [MockedUser.new]

        def find(token:)
          USERS.find { |user| user.token == token }
        end
      end
    end
  end
end
