require_relative "builder"
require_relative "query_response"

module OpenFoodBank
  module Recipients
    module ShippingRequests
      class QueryService
        def initialize(repository:, builder: Builder.new)
          @repository = repository
          @builder = builder
        end

        def fetch(user_id:)
          response = repository_response(user_id: user_id)
          QueryResponse.new(
            hits: response.hits.map { |record| build_shipping_request(record) },
            total: response.total
          )
        end

        private

        attr_reader :repository, :builder

        def build_shipping_request(record)
          builder.build(record)
        end

        def repository_response(params)
          repository.fetch(params)
        end
      end
    end
  end
end
