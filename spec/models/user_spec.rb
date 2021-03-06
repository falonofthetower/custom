require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:replies) }
end
