FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }

    factory :user_with_links do
      after(:build) do |user|
        3.times do
          link = build(:link, user: user)
          link.comments << build(:comment, user: user, link: link)
          user.links << link
        end
      end
    end

  end
end
