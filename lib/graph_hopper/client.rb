require "json"

module GraphHopper
  class ClientError < StandardError; end
  class BadRequest < ClientError; end
  class ApiLimitReached < ClientError; end
  class Unauthorized < ClientError; end
  class UnknownStatusError < ClientError; end

  class Client
    ERRORS = { 400 => BadRequest,
               401 => Unauthorized,
               429 => ApiLimitReached }

    def initialize(http_client)
      @http_client = http_client
    end

    def geocode(query_text)
      Response.new(http_client.get("/geocode", { q: query_text }))
    end

    def route(point_a, point_b, vehicle="car")
      response = response_obj(
        http_client.get_params_string("/route",
                                      "point=#{point_a}&point=#{point_b}&vehicle=#{vehicle}")
      )

      raise_error(response.code) unless response.success?
      response
    end

    private

    def response_obj(raw_response)
      Response.new(raw_response)
    end

    attr_reader :http_client

    def raise_error(code)
      raise ERRORS[code] || UnknownStatusError
    end

    class Response
      SUCCESS_CODE = 200.freeze

      attr_reader :body, :response

      def initialize(response)
        @response = response
        unless response.body.nil?
          @body = JSON.parse(response.body)
        end
        @code = response.code
      end

      def success?
        code == SUCCESS_CODE
      end

      def code
        @code.to_i
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

