class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :user, :content, :link, presence: true
end
