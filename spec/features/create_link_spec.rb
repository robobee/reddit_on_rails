require 'rails_helper'

feature 'Create Link' do

  let(:user) { create(:user) }

  scenario 'successfully creates link for a signed in user' do

    sign_in(user)

    link = { url: 'http://google.com', title: 'Awesome Search Engine!' }

    click_link 'Add a link'
    fill_in 'Url',                   :with => link[:url]
    fill_in 'Title',                 :with => link[:title]
    click_button 'Share'

    expect(page).to have_content 'Link was successfully created.'
    expect(page).to have_link(link[:title], href: link[:url])
  end

end
