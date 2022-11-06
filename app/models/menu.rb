class Menu < ApplicationRecord
  validates :name, presence: true
  validates :calories, numericality: true, comparison: { greater_than_or_equal_to: 0 }


  def self.sort_menu_by(meal)
    if !meal.nil? && meal != "meal_of_day"
      meal = meal.to_s 
      Menu.where("meal_of_day = ?", meal)
    else 
      Menu.all.order(:meal_of_day)
    end
  end
end
