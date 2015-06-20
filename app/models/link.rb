class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :link_votes

  self.per_page = 20

  validates :url, :title, :user, presence: true

  def votes
    link_votes.sum(:value)
  end

  def self.by_votes
    select('links.*, coalesce(value, 0) as votes')
    .joins('LEFT OUTER JOIN link_votes ON links.id = link_votes.link_id')
    .order('votes DESC')
  end

  def self.text_search(query)
    if query.present?
      where("url @@ :q or title @@ :q", q: query)
    else
      all
    end
  end

end
