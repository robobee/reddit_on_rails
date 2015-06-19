module LoginMacros

  def sign_in(user)
    visit root_path
    click_link 'Sign in'

    fill_in 'Email',                 :with => user.email
    fill_in 'Password',              :with => user.password
    click_button 'Log in'
  end

  def login_user(options = {})
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = options[:user] || FactoryGirl.create(:user)
    sign_in user
  end

end
