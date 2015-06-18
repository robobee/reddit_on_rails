require 'rails_helper'

feature 'Comments' do

  let(:user) { create(:user_with_links) }
  let(:link) { user.links.first }

  scenario 'can be added to links' do

    sign_in(user)

    visit link_path(link)
    expect(page).to have_link(link[:title], href: link[:url])
    expect(page).to have_button("Add comment")

    fill_in 'comment_content', :with => 'This is the greatest thing ever!'
    click_button 'Add comment'

    expect(page).to have_content 'Comment was successfully added.'
    expect(page).to have_content 'This is the greatest thing ever!'
  end

end
