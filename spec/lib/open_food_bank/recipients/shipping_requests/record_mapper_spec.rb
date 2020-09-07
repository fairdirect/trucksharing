require "spec_helper"
require "date"
require "open_food_bank/recipients/shipping_requests/record_mapper"

RSpec.describe "Shipping Request Record Mapper" do
  let(:mapper) { OpenFoodBank::Recipients::ShippingRequests::RecordMapper.new(record) }
  let(:record) { double(:record_double, record_double_params) }
  let(:record_double_params) do
    {
      id: 1,
      order_number: "BCDSE",
      status: "in_process",
      donation_date: DateTime.now.rfc3339,
      cargo_weight: 1280,
      cargo_weight_unit: "kg",
      cargo_type: "solid",
      cargo_quantity: 4,
      cargo_unit: "pallete"
    }
  end

  let(:expected_weight_hash) do
    { value: record_double_params[:cargo_weight], unit: record_double_params[:cargo_weight_unit] }
  end

  let(:expected_cargo_hash) do
    {
      type: record_double_params[:cargo_type],
      quantity: record_double_params[:cargo_quantity],
      unit: record_double_params[:cargo_unit]
    }
  end

  it { expect(mapper.id).to eq record_double_params[:id] }
  it { expect(mapper.order_number).to eq record_double_params[:order_number] }
  it { expect(mapper.status).to eq record_double_params[:status] }
  it { expect(mapper.donation_date).to eq record_double_params[:donation_date] }
  it { expect(mapper.weight).to eq expected_weight_hash }
  it { expect(mapper.cargo).to eq expected_cargo_hash }
end
