require_relative "abstract_strategy"
require_relative "mocked_user_repository"

module OpenFoodBank
  module Users
    module Authentication
      class MockedStrategy < AbstractStrategy
        def initialize(user_repository: MockedUserRepository.new)
          super
        end

        def authenticate(token)
          found_user = user_repository.find(token: token)

          raise UnknownTokenError if found_user.nil?

          found_user
        end
      end
    end
  end
end
