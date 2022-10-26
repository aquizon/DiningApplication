class CreateDininghalls < ActiveRecord::Migration[7.0]
  def change
    create_table :dininghalls do |t|
      t.text :name
      t.text :hours
      t.text :breakfast_hours
      t.text :lunch_hours
      t.text :dinner_hours
      t.time :time
      
      t.timestamps
    end
  end
end
