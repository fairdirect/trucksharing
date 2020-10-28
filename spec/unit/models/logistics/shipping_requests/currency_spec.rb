require "rails_helper"

RSpec.describe Logistics::ShippingRequests::Currency do
  shared_examples "currency" do |short_name, has_cents, cents, expected_amount|
    let(:attrs) { { short_name: short_name, has_cents: has_cents } }

    it { expect(currency.cents_to_dollars(cents)).to eq expected_amount }
  end

  let(:currency) { described_class.new(attrs) }

  it_behaves_like "currency", "EUR", true, 5000, 50.0
  it_behaves_like "currency", "Yen", false, 5000, 5000.0
end

