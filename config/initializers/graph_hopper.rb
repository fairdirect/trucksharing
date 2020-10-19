require "graph_hopper"

GraphHopper.configure { |conf| conf.api_key = ENV["GRAPH_HOPPER_API_KEY"] }
