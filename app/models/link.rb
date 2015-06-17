class Link < ActiveRecord::Base
  belongs_to :user

  validates :url, :title, :user, presence: true
end
