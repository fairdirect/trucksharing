require "rails_helper"

RSpec.describe Logistics::ShippingRequest, type: :model do
  let(:shipping_request) { FactoryBot.build(:shipping_request) }

  it { expect(shipping_request).to be_valid }

  describe "#delivery_address" do
    subject { shipping_request.delivery_address }

    it { expect(subject).to be_an_instance_of(Logistics::ShippingRequests::Address) }
  end

  describe "#delivery_address" do
    subject { shipping_request.pickup_address }

    it { expect(subject).to be_an_instance_of(Logistics::ShippingRequests::Address) }
  end
end

