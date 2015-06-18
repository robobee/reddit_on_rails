FactoryGirl.define do

  factory :comment do
    content { Faker::Lorem.sentence }
    association :user
    association :link
  end

end
