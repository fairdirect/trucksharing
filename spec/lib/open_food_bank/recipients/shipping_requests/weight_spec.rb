require "spec_helper"
require "open_food_bank/recipients/shipping_requests/weight"

RSpec.describe "Weight Value Object" do
  let(:value_object) { OpenFoodBank::Recipients::ShippingRequests::Weight.new(params) }
  let(:params) do
    {
      value: 1280,
      unit: "kg"
    }
  end

  it { expect(value_object.value).to eq params[:value] }
  it { expect(value_object.unit).to eq params[:unit] }
  it { expect(value_object.to_s).to eq "1280 kg" }

end
