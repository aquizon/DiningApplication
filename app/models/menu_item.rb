class MenuItem < ApplicationRecord
 # set up habtm relationship to menu
  has_and_belongs_to_many :menus
  validates :name, presence: true
  validates :calories, numericality: true, comparison: { greater_than_or_equal_to: 0 }

  #MOVE TO NEW MENU 
  #@@hours = {"All_Day" => "7:30am - 12:00am", "Breakfast" => "7:30am - 11:00am", "Lunch" => "11:00am - 4:00pm", "Dinner" => "4:00pm - 12:00am"}
  #def self.get_menu_hours(time_of_day)
  #  if (time_of_day.nil?)
  #    @@hours["All_Day"]
  #  else
  #    @@hours[time_of_day]
  #  end
  #end
  
  def self.sort_items_by(meal, filters)
    query = ""
    if !meal.nil? && meal != "meal_of_day"
      meal = meal.to_s 
      query = MenuItem.where("meal_of_day = ?", meal)
    else 
      query =  MenuItem.all.order(:meal_of_day)
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
