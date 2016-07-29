class User < ApplicationRecord
  include Clearance::User

  has_many :upvotes
  has_many :links

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
