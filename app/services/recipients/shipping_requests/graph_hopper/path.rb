module Recipients
  module ShippingRequests
    module GraphHopper
      class Path
        attr_reader :raw_path

        def initialize(raw_path)
          @raw_path = raw_path
        end

        def distance
          raw_path["distance"]
        end
      end
    end
  end
end

