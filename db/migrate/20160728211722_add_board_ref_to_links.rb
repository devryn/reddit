class AddBoardRefToLinks < ActiveRecord::Migration[5.0]
  def change
    reference :links, :board, foreign_key: true
  end
end
