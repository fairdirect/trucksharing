require "rails_helper"

RSpec.describe Logistics::Route, type: :model do
  let(:route) { FactoryBot.build(:route) }

  it { expect(route).to be_valid }
end

