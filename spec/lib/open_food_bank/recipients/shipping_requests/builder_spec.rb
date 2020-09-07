require "spec_helper"
require "date"
require "open_food_bank/recipients/shipping_requests/builder"

RSpec.describe "Shipping Request Builder" do
  let(:builder) { OpenFoodBank::Recipients::ShippingRequests::Builder.new }
  let(:resource_object) { double(:resource, resource_attrs) }
  let(:resource_attrs) do
    {
      id: 1,
      order_number: "BCDSE",
      status: "in_process",
      donation_date: DateTime.now.rfc3339,
      weight: { value: 1280, unit: "kg" },
      cargo: { type: "solid", quantity: 4, unit: "pallete" }
    }
  end

  describe "#build" do
    subject { builder.build(resource_object) }

    it { expect(subject).to respond_to(:id, :order_number, :status, :donation_date, :weight, :cargo) }
  end

end
