FactoryGirl.define do
  
  factory :link_vote do
    association :user
    association :link
    
    factory :upvote do
      value 1
    end

    factory :downvote do
      value -1
    end
  end

end
