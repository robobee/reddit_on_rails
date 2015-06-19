class LinkVote < ActiveRecord::Base

  belongs_to :user
  belongs_to :link

  validates :link_id, uniqueness: { scope: :user_id }
  validates :value, inclusion: { in: [1, -1] }
  validate :not_users_link

  def not_users_link
    errors.add :user_id, "is the creator of the link" if link.user_id == user_id
  end

end
