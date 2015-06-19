require 'rails_helper'

feature 'Vote on links' do

  let(:user) { create(:user) }
  let(:link) { create(:link) }

  scenario 'user can vote on submited links' do

    sign_in(user)

    visit link_path(link)

    within ".link-main" do
      expect(page).to have_content link.title
      expect(page).to have_link(link[:title], href: link[:url])
      find('.upvote').click
    end

    within ".link-main .votes" do
      assert_text 1
    end

    within ".link-main" do
      find('.upvote').click
    end
    expect(page).to have_content 'You have already voted.'

    within ".link-main" do
      find('.downvote').click
    end

    within ".link-main .votes" do
      assert_text -1
    end

  end

end
