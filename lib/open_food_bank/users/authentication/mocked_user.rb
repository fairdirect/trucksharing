module OpenFoodBank
  module Users
    module Authentication
      class MockedUser
        def initialize(token: "2e48afa0-ad6b-424b-b216-6ed41213d98a", id: 1, role: "recipient")
          @id = 1
          @token = token
          @role = role
        end

        attr_reader :token, :id, :role
      end
    end
  end
end
