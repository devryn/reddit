class AddUserRefToUpvotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :upvotes, :user, foreign_key: true
  end
end
