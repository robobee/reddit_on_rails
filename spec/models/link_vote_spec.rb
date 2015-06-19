require 'rails_helper'

RSpec.describe LinkVote, type: :model do
  
  let(:vote) { create(:upvote) }

  it "has valid factory" do
    expect(vote).to be_valid
  end

  it "is not valid with wrong value" do
    vote.value = 2
    expect(vote).not_to be_valid
  end

  it "is not valid with the same user" do
    vote.user_id = vote.link.user_id
    vote.valid?
    expect(vote.errors[:user_id]).to include("is the creator of the link")
  end

  it "is not valid with the same user voting again" do
    second_vote = build(:upvote, user: vote.user, link: vote.link)
    expect(second_vote).not_to be_valid
  end

  it "is valid for other user voting on the same link" do
    second_vote = build(:upvote, user: create(:user), link: vote.link)
    expect(second_vote).to be_valid
  end

end
