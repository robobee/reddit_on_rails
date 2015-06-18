FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }

    after(:build) do |user|
      3.times do
        user.links << FactoryGirl.build(:link, user: user)
      end
    end

  end
end
