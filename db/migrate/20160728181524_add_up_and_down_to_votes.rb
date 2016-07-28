class AddUpAndDownToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :upvote, :boolean, default: false
    add_column :votes, :downvote, :boolean, default: false
  end
end
