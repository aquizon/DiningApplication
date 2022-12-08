class CreateDininghalls < ActiveRecord::Migration[7.0]
  def change
    create_table :dininghalls do |t|
      t.text :name
      t.text :hours
      t.time :time
      t.text :menu

      t.timestamps
    end
  end
end
