class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :meal_of_day
      t.integer :begin_time
      t.integer :end_time
      t.references :dining_hall, foreign_key: true
      t.timestamps
    end
  end
end
