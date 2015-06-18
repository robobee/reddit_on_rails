require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user_with_links) }
  let(:comment) { user.comments.first }

  it "has valid factory" do
    expect(comment).to be_valid
  end

  it "is not valid without user" do
    comment.user = nil
    expect(comment).not_to be_valid
  end

  it "is not valid without content" do
    comment.content = ''
    expect(comment).not_to be_valid
  end

  it "is not valid without link" do
    comment.link = nil
    expect(comment).not_to be_valid
  end

end
