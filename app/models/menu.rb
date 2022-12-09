class Menu < ApplicationRecord
    has_and_belongs_to_many :menu_items

    belongs_to :dininghall

    def get_time_str(time_obj)
      am_pm = "AM"
      hour = time_obj.hour
      if (hour > 12) 
        hour -= 12
        am_pm = "PM"
      end
      hour = hour.to_s
      min = time_obj.min.to_s
      if (min == "0") 
        min = "00"
      end
      hour + ":" + min + " " + am_pm 
    end
    def get_menu_hours
      if (self.meal_of_day.nil?)
        ""
      else
        begin_t = self.begin_time
        end_t = self.end_time
        begin_time_str = get_time_str(begin_t)
        end_time_str = get_time_str(end_t)
        begin_time_str + " - " + end_time_str
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
