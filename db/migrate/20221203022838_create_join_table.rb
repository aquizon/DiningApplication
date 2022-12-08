class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table 'menu_items_menus', :id => false do |t|
      t.references 'menu'
      t.references 'menu_item'
    end
  end
end