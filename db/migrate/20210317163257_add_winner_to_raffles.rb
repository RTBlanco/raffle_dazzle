class AddWinnerToRaffles < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :winner_id
    add_column :raffles, :winner_id, :integer
  end
end
