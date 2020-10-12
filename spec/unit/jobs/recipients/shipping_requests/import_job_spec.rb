require "rails_helper"

RSpec.describe Recipients::ShippingRequests::ImportJob, type: :job do
  let(:recipient) { FactoryBot.create(:user) }

  it "queues an import job" do
    expect {
      described_class.perform_later(recipient.id)
    }.to have_enqueued_job
  end
end
