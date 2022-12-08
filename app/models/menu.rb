class Menu < ApplicationRecord
    has_and_belongs_to_many :menu_items

    belongs_to :dininghall

    @@hours = {"All_Day" => "7:30am - 12:00am", "Breakfast" => "7:30am - 11:00am", "Lunch" => "11:00am - 4:00pm", "Dinner" => "4:00pm - 12:00am"}
    def self.get_menu_hours(time_of_day)
      if (time_of_day.nil?)
        @@hours["All_Day"]
      else
        @@hours[time_of_day]
      end
    end

    def self.get_dininghall_name(menu_id)
      menu = Menu.find(menu_id)
      d = Dininghall.find(menu.dininghall_id)
      d.name
    end
    def self.sort_items_by(menu_id, filters)
      menu = Menu.find(menu_id)
      query = menu.menu_items

      filters.each do |filter|
        if filter == "vegan" || filter == "vegetarian"
          query = query.where("diet LIKE ?", "%#{filter}%")
        else
          query = query.where("allergens NOT LIKE ?", "%#{filter}%")
        end
      end
      query
    end
end
