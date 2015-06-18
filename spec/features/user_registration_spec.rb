require 'rails_helper'

feature 'User Registration' do

  scenario 'allows new users to register with an email address and password' do

    visit root_path

    click_link "Sign up"

    fill_in "Email",                 :with => "example@example.com"
    fill_in "Password",              :with => "password"
    fill_in "Password confirmation", :with => "password"

    click_button "Sign up"

    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome! You have signed up successfully.'

    within 'nav.navbar' do
        expect(page).to have_content 'example@example.com'
    end
  end

end
