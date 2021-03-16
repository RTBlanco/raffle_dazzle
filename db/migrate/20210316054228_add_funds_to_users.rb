class AddFundsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :funds, :decimal, null: false, default: 0
  end
end
