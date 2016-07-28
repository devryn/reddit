class AddUserReftoLinks < ActiveRecord::Migration[5.0]
  def change
    add_reference :links, :user, foreign_key: true
    add_reference :links, :vote, foreign_key: true
    add_reference :votes, :user, foreign_key: true
  end
end
