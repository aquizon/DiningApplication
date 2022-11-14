class Menu < ApplicationRecord
  validates :name, presence: true
  validates :calories, numericality: true, comparison: { greater_than_or_equal_to: 0 }
  @@hours = {"All_Day" => "7:30am - 12:00am", "Breakfast" => "7:30am - 11:00am", "Lunch" => "11:00am - 4:00pm", "Dinner" => "4:00pm - 12:00am"}
  def self.get_menu_hours(time_of_day)
    if (time_of_day.nil?)
      @@hours["All_Day"]
    else
      @@hours[time_of_day]
    end
  end

  def self.sort_menu_by(meal)
    if !meal.nil? && meal != "meal_of_day"
      meal = meal.to_s 
      Menu.where("meal_of_day = ?", meal)
    else 
      Menu.all.order(:meal_of_day)
    end
  end
end
