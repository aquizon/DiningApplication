class CreateDininghalls < ActiveRecord::Migration[7.0]
  def change
    create_table :dininghalls do |t|
      t.text :name
      t.text :hours

      t.timestamps
    end
  end
end
