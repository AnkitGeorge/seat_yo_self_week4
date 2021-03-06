class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :cuisine
      t.string :price_range
      t.string :phone
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
