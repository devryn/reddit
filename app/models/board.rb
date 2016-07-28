class Board < ApplicationRecord
  has_many :links

  validates :name, presence: true
end
