require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "has valid factory" do
    expect(user).to be_valid
  end

end
