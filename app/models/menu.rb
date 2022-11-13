class Menu < ApplicationRecord
 # belongs_to :dining_hall
  validates :name, presence: true
  validates :calories, numericality: true, comparison: { greater_than_or_equal_to: 0 }


  def self.sort_menu_by(meal, filters)
    query = ""
    if !meal.nil? && meal != "meal_of_day"
      meal = meal.to_s 
      query = Menu.where("meal_of_day = ?", meal)
    else 
      query =  Menu.all.order(:meal_of_day)
    end
    filters.each do |filter|
      #debugger
      if filter == "vegan" || filter == "vegetarian"
        query = query.where("diet LIKE ?", "%#{filter}%")
      else
        query = query.where("allergens NOT LIKE ?", "%#{filter}%" )
      end   
    end
    query 
  end


end
