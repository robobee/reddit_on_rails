require 'rails_helper'

feature 'Create Link' do

  let(:user) { create(:user) }

  scenario 'successfully creates link for a signed in user' do

    visit root_path
    click_link 'Sign in'

    fill_in 'Email',                 :with => user.email
    fill_in 'Password',              :with => user.password
    click_button 'Log in'

    expect(current_path).to eq root_path

    link = { url: 'http://google.com', title: 'Awesome Search Engine!' }

    click_link 'Add a link'
    fill_in 'Url',                   :with => link[:url]
    fill_in 'Title',                 :with => link[:title]
    click_button 'Share'

    expect(page).to have_content 'Link was successfully created.'
    expect(page).to have_link(link[:title], href: link[:url])
  end

end
