require 'rails_helper'

feature 'User Sign In' do

  let(:user) { create(:user) }

  scenario 'allows registered users to sign in' do

    visit root_path
    click_link 'Sign in'

    fill_in 'Email',                 :with => user.email
    fill_in 'Password',              :with => user.password
    click_button 'Log in'

    expect(current_path).to eq root_path
    within 'nav.navbar' do
        expect(page).to have_content(user.email)
    end
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'does not allow unregistered users to sign in' do
    
    visit root_path
    click_link 'Sign in'

    fill_in 'Email',                 :with => 'random@example.com'
    fill_in 'Password',              :with => 'password'
    click_button 'Log in'

    expect(current_path).to eq new_user_session_path
    within 'nav.navbar' do
        expect(page).not_to have_content(user.email)
    end
    expect(page).not_to have_content 'Signed in successfully.'
    expect(page).to have_content 'Invalid email or password.'
  end

end
