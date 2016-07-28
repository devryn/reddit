class Board < ApplicationRecord
  has_many :links

  validates :name, presence: true

  paginates_per 20
end
