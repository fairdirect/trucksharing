require "spec_helper"
require "date"
require "open_food_bank/recipients/shipping_requests/entity"

RSpec.describe "Shipping Request Entity" do
  let(:entity) { OpenFoodBank::Recipients::ShippingRequests::Entity.new(params) }
  let(:params) do
    {
      id: 1,
      order_number: "BCDSE",
      status: "in_process",
      donation_date: DateTime.now.rfc3339,
      cargo: double("Cargo Value Object", type: "solid", quantity: "4", unit: "pallete"),
      weight: double("Weight Value Object", value: 1280, unit: "kg")
    }
  end
  # TODO: add cargo and weight value objects

  it { expect(entity.id).to eq params[:id] }
  it { expect(entity.order_number).to eq params[:order_number] }
  it { expect(entity.status).to eq params[:status] }
  it { expect(entity.donation_date).to eq params[:donation_date] }
  it { expect(entity).to respond_to(:cargo) }
  it { expect(entity).to respond_to(:weight) }
end
