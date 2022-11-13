class Menu < ApplicationRecord
 # belongs_to :dining_hall
  validates :name, presence: true
  validates :calories, numericality: true, comparison: { greater_than_or_equal_to: 0 }


  def self.sort_menu_by(meal, allergens)
    query = ""
    if !meal.nil? && meal != "meal_of_day"
      meal = meal.to_s 
      query = Menu.where("meal_of_day = ?", meal)
    else 
      query =  Menu.all.order(:meal_of_day)
    end

    allergens.each do |allergy|
      #debugger
      query = query.where("allergens NOT LIKE ?", "%#{allergy}%" )
    end
    query 
  end

  def self.filter_dietary(allergies)
    #these two need to be called on one another
    #also need to add a filter option 
    allergies.each do |allergy|
      allergy = allergy.to_s
      menu = Menu.where("allergens != ?", allergy)
    end
    menu
  end
end
