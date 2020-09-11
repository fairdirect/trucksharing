require "ostruct"
require_relative "repository_response"

module Recipients
  module ShippingRequests
    class RecordNotFound < StandardError
    end

    class MockedRepository
      MOCKED_RECORDS = [
        {
          id: 1,
          user_id: 1,
          order_number: "BCDSE",
          status: "in_process",
          donation_date: DateTime.new(2020,9,8,12,0,5),
          cargo_weight: 1280,
          cargo_weight_unit: "kg",
          cargo_type: "solid",
          cargo_quantity: 4,
          cargo_unit: "pallete"
        },
        {
          id: 2,
          user_id: 1,
          order_number: "TREDF",
          status: "in_process",
          donation_date: DateTime.new(2020,9,8,12,0,10),
          cargo_weight: 2030,
          cargo_weight_unit: "kg",
          cargo_type: "liquid",
          cargo_quantity: 6,
          cargo_unit: "pallete"
        }
      ]

      def fetch(user_id:)
        records = user_records(user_id).map { |rec| OpenStruct.new(rec) }
        RepositoryResponse.new(hits: records, total: total(user_id))
      end

      def find(user_id:, id:)
        record = user_records(user_id).find { |rec| rec[:id] == id }
        raise RecordNotFound if record.nil?
        OpenStruct.new(record)
      end

      private

      def total(user_id)
        user_records(user_id).size
      end

      def user_records(user_id)
        MOCKED_RECORDS.select { |record| record[:user_id] == user_id }
      end
    end
  end
end
