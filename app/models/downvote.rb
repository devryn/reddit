class Downvote < ApplicationRecord
  belongs_to :link, counter_cache: true
  belongs_to :user
end
