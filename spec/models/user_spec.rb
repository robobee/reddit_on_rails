require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it "has valid factory" do
    expect(user).to be_valid
  end

  it "has three links" do
    expect(user.links.count).to eq 3
  end

end
