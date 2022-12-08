class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.string :meal_of_day
      t.text :ingredients
      t.integer :calories
      t.text :allergens
      t.text :diet
      t.text :status
      t.timestamps
    end
  end
end
