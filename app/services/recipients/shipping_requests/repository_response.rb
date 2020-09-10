module Recipients
  module ShippingRequests
    class RepositoryResponse
      def initialize(hits:, total:)
        @hits = hits
        @total = total
      end

      attr_reader :hits, :total
    end
  end
end
