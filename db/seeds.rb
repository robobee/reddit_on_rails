require 'faker'

3.times do
  user = User.create(:email => Faker::Internet.email,
                     :username => Faker::Internet.user_name,
                     :password => Faker::Internet.password)

  3.times do
    user.links.create(:url => Faker::Internet.url, 
                      :title => Faker::Lorem.sentence)
  end

end
