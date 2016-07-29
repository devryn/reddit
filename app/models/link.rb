class Link < ApplicationRecord
  has_many :upvotes
  has_many :downvotes
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true
  validates :user_id, presence: true

  paginates_per 20

  def votes_count
    [upvotes.count - downvotes.count, 0].max
  end
end
