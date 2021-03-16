class AddCostToRaffles < ActiveRecord::Migration[6.1]
  def change
    add_column :raffles, :cost, :integer
  end
end
