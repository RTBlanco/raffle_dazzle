class AddCostToRaffles < ActiveRecord::Migration[6.1]
  def change
    add_column :raffles, :cost, :decimal, null: false, default: 0
  end
end
