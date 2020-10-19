require "json"

module GraphHopper
  class Client
    def initialize(http_client)
      @http_client = http_client
    end

    def geocode(query_text)
      Response.new(http_client.get("/geocode", { q: query_text }))
    end

    private

    attr_reader :http_client

    class Response
      attr_reader :body, :response

      def initialize(response)
        @response = response
        @body = JSON.parse(response.body)
      end

      def code
        response.code
      end

      def empty?
        ["hits"].empty?
      end

      def [](key)
        body[key]
      end
    end
  end
end

