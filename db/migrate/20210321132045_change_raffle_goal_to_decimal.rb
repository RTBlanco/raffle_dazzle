class ChangeRaffleGoalToDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :raffles, :goal, :decimal
  end
end
