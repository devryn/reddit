class Link < ApplicationRecord
  has_many :upvotes
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true
  validates :user_id, presence: true

  paginates_per 20


end
