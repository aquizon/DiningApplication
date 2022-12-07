class Menu < ApplicationRecord
    has_and_belongs_to_many :menu_items
    belongs_to :dining_hall

#MOVED TO NEW MENU 
  @@hours = {"All_Day" => "7:30am - 12:00am", "Breakfast" => "7:30am - 11:00am", "Lunch" => "11:00am - 4:00pm", "Dinner" => "4:00pm - 12:00am"}
  def self.get_menu_hours(time_of_day)
    if (time_of_day.nil?)
      @@hours["All_Day"]
    else
      @@hours[time_of_day]
    end
  end



end
