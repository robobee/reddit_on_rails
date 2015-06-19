class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :link_votes

  validates :url, :title, :user, presence: true

  def votes
    link_votes.sum(:value)
  end
end
