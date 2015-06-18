require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:user_with_links) { create(:user_with_links) }

  it "has valid factory" do
    expect(user).to be_valid
  end

  context "user_with_links" do
    it "has three links" do
      expect(user_with_links.links.count).to eq 3
    end

    it "each link has one comment" do
      expect(user_with_links.links.first.comments.count).to eq 1
    end
  end

end
