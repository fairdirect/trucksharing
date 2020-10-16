module Mocks
  class GraphHopperClient
    MOCKED_QUERY = "Germany Munchen Ernst-Schneider-Weg 9".freeze

    RESULT = [{ point: { lat: 48.2113654, lng: 11.5848575 } }].freeze
    EMPTY_RESULT = [].freeze

    def geocode(text)
      {
        hits: MOCKED_QUERY == text ? RESULT : EMPTY_RESULT
      }
    end

    def find_geocode(text)
      geocode(text)[:hits].first
    end
  end
end

