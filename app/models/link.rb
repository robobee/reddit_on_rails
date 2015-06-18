class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :url, :title, :user, presence: true
end
