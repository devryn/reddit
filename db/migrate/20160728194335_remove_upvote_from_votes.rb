class RemoveUpvoteFromVotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :upvotes, :upvote, :boolean
    remove_column :upvotes, :downvote, :boolean
  end
end
