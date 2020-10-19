require 'net/http'
require 'uri'
require 'json'

module GraphHopper
  class HttpClient
    DEFAULT_HEADER = { "Content-Type" => "application/json" }

    def initialize(host, api_key)
      @host = formatted_url(host)
      @api_key = api_key
    end

    def get(path, params)
      uri = URI(host + path)
      uri_params = params.merge(key: api_key)
      uri.query = URI.encode_www_form(uri_params)

      Net::HTTP.get_response(uri)
    end

    private

    attr_reader :host, :api_key

    def parse_json(json_string)
      JSON.parse(json_string)
    end

    def formatted_url(url)
      url.chomp('/')
    end
  end
end
