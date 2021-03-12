class CreateRaffles < ActiveRecord::Migration[6.1]
  def change
    create_table :raffles do |t|
      t.belongs_to :user
      t.string :title
      t.string :item
      t.string :description
      t.integer :goal

      t.timestamps
    end
  end
end
