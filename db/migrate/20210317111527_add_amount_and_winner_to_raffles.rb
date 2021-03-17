class AddAmountAndWinnerToRaffles < ActiveRecord::Migration[6.1]
  def change
    add_column :raffles, :amount, :decimal, null: false, default: 0
  end
end
