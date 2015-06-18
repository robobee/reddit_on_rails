require 'rails_helper'

feature 'Main Page Link Feed' do

  let(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let(:my_link) { user.links.first }
  let(:other_link) { another_user.links.first }

  scenario 'can see my links and links of other users' do

    sign_in(user)

    visit root_path

    save_and_open_page
    expect(page).to have_link(my_link[:title], href: my_link[:url])
    expect(page).to have_link(other_link[:title], href: other_link[:url])

  end

end
