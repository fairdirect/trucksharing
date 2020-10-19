require "graph_hopper/http_client"
require "graph_hopper/client"

module GraphHopper
  HOST_URI = "https://graphhopper.com/api/1".freeze

  class Error < StandardError; end

  class << self
    attr_accessor :configuration, :client
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
    self.client = Client.new(HttpClient.new(HOST_URI, configuration.api_key))
  end

  class Configuration
    attr_accessor :api_key
  end
end

