class MenusController < ApplicationController
  def menu_index
    @menus = Menu.all.order(:meal_of_day)
  end
end
