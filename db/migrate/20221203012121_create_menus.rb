class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :meal_of_day
      t.time :begin_time
      t.time :end_time
      t.references :dininghall, foreign_key: true
      t.timestamps
      
    end
  end
end
