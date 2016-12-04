require 'rails_helper'

RSpec.describe ErrorProxy do
  let(:messages) { ["can't be blank", "is too short (minimum is 10 characters)"] }

  subject do
    ErrorProxy.new(messages)
  end

  it "sets the messages" do
    expect(subject.messages).to eq(messages)
  end

  it "responds to messages?" do
    expect(subject.messages?).to be_truthy
  end
end
