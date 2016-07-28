class User < ApplicationRecord
  has_many :upvotes
  has_many :links
end
