class AddWinnerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :winner_id, :integer
  end
end
