require "spec_helper"
require "open_food_bank/recipients/shipping_requests/cargo"

RSpec.describe "Cargo Value Object" do
  let(:value_object) { OpenFoodBank::Recipients::ShippingRequests::Cargo.new(params) }
  let(:params) do
    {
      type: "solid",
      quantity: 4,
      unit: "pallete"
    }
  end

  it { expect(value_object.type).to eq params[:type] }
  it { expect(value_object.quantity).to eq params[:quantity] }
  it { expect(value_object.unit).to eq params[:unit] }
  it { expect(value_object.volume).to eq "4 palletes" }
end
