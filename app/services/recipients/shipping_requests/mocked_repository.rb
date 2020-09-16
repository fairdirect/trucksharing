require_relative "repository_response"
require_relative "mocks/generator"

module Recipients
  module ShippingRequests
    class RecordNotFound < StandardError
    end

    class MockedRepository
      def fetch(user_id:)
        RepositoryResponse.new(hits: user_records(user_id), total: total(user_id))
      end

      def find(user_id:, id:)
        record = user_records(user_id).find { |rec| rec.id == id }
        raise RecordNotFound if record.nil?
        record
      end

      private

      def total(user_id)
        user_records(user_id).size
      end

      def user_records(user_id)
        mocked_records.select { |record| record.user_id == user_id }
      end

      def mocked_records
        @mocked_records ||= [
          record_generator.generate_record(id: 1, user_id: 1, order_number: "26f0346684435c8d87955fe5"),
          record_generator.generate_record(
            id: 2, user_id: 1, created_at: DateTime.new(2020,9,8,12,0,5), order_number: "8bac9c9e975d8ddbcc0d9c1c"
          )
        ]
      end

      def record_generator
        @record_generator ||= ShippingRequests::Mocks::Generator.new
      end
    end
  end
end
