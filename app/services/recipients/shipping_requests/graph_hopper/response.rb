module Recipients
  module ShippingRequests
    module GraphHopper
      class Response

        attr_reader :raw_response

        def initialize(raw_response)
          @raw_response = raw_response
        end

        def paths
          @paths ||= raw_response["paths"].map { |raw_path| GraphHopper::Path.new(raw_path) }
        end

        def empty?
          paths.empty?
        end

        def top_path
          paths.first
        end
      end
    end
  end
end

