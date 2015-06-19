FactoryGirl.define do

  factory :link do
    url { Faker::Internet.url }
    title { Faker::Lorem.sentence }
    association :user

    factory :link_with_comments do
      after(:build) do |link|
        3.times do
          link.comments << build(:comment, link: link)
        end
      end
    end

    factory :invalid_link do
      url nil
    end
  end

end
