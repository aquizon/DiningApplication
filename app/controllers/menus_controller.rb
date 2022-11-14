class MenusController < ApplicationController
  before_action :admin_logged_in?, only: [:new, :create, :destroy]
  def index
    order = params[:order] || 'meal_of_day'
    allergens = get_dietary_restrictions
    @menus = Menu.sort_menu_by(order, allergens)

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

  def destroy
    # load existing object again from URL param
    item = Menu.find(params[:id])
    # destroy object
    item.destroy
    respond_to do |format|
      format.html do
        # success message
        flash[:success] = 'Item removed successfully'
        redirect_to menus_path
      end
    end
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
    params.require(:menu).permit(:name, :description, :meal_of_day, :ingredients, :calories, :allergens, :diet, :status)
  end

  def get_dietary_restrictions
    diets = ["dairy", "gluten", "soy", "nuts", "vegan", "vegetarian"]
    filter = []
    diets.each do |diet|
      if !params[diet].nil?
        filter << diet
      end
    end
    filter
  end


  def admin_logged_in?
    return true if user_signed_in? && current_user.admin
  
    flash[:alert] = "Only admin users can create new menu items"
    redirect_to new_user_session_path and return
  end
end
