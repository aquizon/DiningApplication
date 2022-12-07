class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table 'menus_menu_items', :id => false do |t|
      t.references 'menus'
      t.references 'menu_items'
    end
  end
end