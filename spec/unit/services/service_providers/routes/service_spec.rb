require "rails_helper"

RSpec.describe ServiceProviders::Routes::Service do
  let(:service) { described_class.new(geocode_service: geocode_service) }
  let(:geocode_service) { double(:geocode_service, find!: geocode_service_response) }
  let(:geocode_service_response) do
    double(:response, latitude: "43.123", longitude: "13.333", to_params: "43.123,13.333")
  end
  let(:user) { FactoryBot.create(:service_provider) }

  let(:params) do
    {
      user_id: user.id,
      departing_at: 7.days.since,
    }.merge(destination_address_params).merge(departure_address_params)
  end

  let(:destination_address_params) do
    { destination_city: "Berlin", destination_country: "DE", destination_house: "14",
      destination_street: "Ernst-Barlach-Straße", destination_zip: "13059" }
  end

  let(:departure_address_params) do
    { departure_city: "Leipzig", departure_country: "DE", departure_house: "45",
      departure_street: "Coppistraße", departure_zip: "04157" }
  end

  describe "#register_route" do
    subject { service.register_route(params) }

    it "returns a record of a route" do
      record = subject
      expect(record.user_id).to eq user.id
      expect(record.departure_lat).to eq geocode_service_response.latitude
      expect(record.departure_lng).to eq geocode_service_response.longitude
      expect(record.destination_lat).to eq geocode_service_response.latitude
      expect(record.destination_lng).to eq geocode_service_response.longitude
    end
  end
end

