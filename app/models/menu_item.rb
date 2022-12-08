
class MenuItem < ApplicationRecord
 # set up habtm relationship to menu
  has_and_belongs_to_many :menus
  validates :name, presence: true
  validates :calories, numericality: true, comparison: { greater_than_or_equal_to: 0 }

  #def self.sort_items_by(current_menu, filters)
   # query = Menu.find_by_id(current_menu).menu_items
    
    #if !meal.nil? && meal != "meal_of_day"
    #  meal = meal.to_s 
    #  query = MenuItem.where("meal_of_day = ?", meal)
    #else 
    #  query =  MenuItem.order(:meal_of_day)
    #end
    #filters.each do |filter|
      #debugger
     # if filter == "vegan" || filter == "vegetarian"
     #   query = query.where("diet LIKE ?", "%#{filter}%")
     # else
     #   query = query.where("allergens NOT LIKE ?", "%#{filter}%" )
     # end   
   # end
  # query 
 # end


end
