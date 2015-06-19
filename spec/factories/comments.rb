FactoryGirl.define do

  factory :comment do
    content { Faker::Lorem.sentence }
    association :user
    association :link

    factory :invalid_comment do
      content nil
    end
  end

end
