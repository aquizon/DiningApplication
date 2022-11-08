class MenusController < ApplicationController
  before_action :admin_logged_in?, only: [:new, :create]
  def index
    order = params[:order] || 'meal_of_day'
    @menus = Menu.sort_menu_by(order)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    m = Menu.new(create_update_params)
    if m.save
      flash[:notice] = "Menu Item #{m.name} successfully created"
      redirect_to menus_path
    else
      flash[:warning] = 'Menu Item could not be entered'
      redirect_to new_menu_path
    end
  end

  def edit
    @menu = Menu.find params[:id]
  end

  def update
    @menu = Menu.find params[:id]
    @menu.update(create_update_params)
    flash[:notice] = "#{@menu.name} was successfully updated"
    redirect_to menu_path(@menu)
  end

  def get_previous_path
    if request.referrer != Rails.root
      return request.referrer 
    end
    return Rails.root
  end
  helper_method :get_previous_path

  private

  def create_update_params
    params.require(:menu).permit(:name, :description, :meal_of_day, :ingredients, :calories, :allergens, :diet)
  end
end

def admin_logged_in?
  return true if user_signed_in? && current_user.admin
  
  flash[:alert] = "Only admin users can create new toys"
  redirect_to new_user_session_path and return
end
