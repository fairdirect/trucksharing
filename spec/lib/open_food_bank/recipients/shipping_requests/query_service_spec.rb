require "spec_helper"
require "open_food_bank/recipients/shipping_requests/query_service"
require "open_food_bank/recipients/shipping_requests/mocked_repository"

RSpec.describe "Shipping Request Query Service" do
  let(:query_service) { OpenFoodBank::Recipients::ShippingRequests::QueryService.new(repository: repository) }
  let(:repository)    { OpenFoodBank::Recipients::ShippingRequests::MockedRepository.new }

  describe "#fetch" do
    subject { query_service.fetch(user_id: 1) }

    it "returns a collection of shipping requests" do
      result = subject
      expect(result.total).to eq 2
    end
  end
end
