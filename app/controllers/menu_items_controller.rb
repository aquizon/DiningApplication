class MenuItemsController < ApplicationController
  before_action :admin_logged_in?, only: [:new, :create, :destroy]
  def index
    allergens = get_dietary_restrictions
    @menu_items = MenuItem.sort_items_by(params[:current_menu], allergens)
  end

  def show
    if (MenuItem.where(id: params[:id]).empty?)
      flash[:notice] = "Menu Item does not exist"
      redirect_to menu_items_path
    else
      @menu_item = MenuItem.find(params[:id])
    end
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    m = MenuItem.new(create_update_params)
    if m.save
      flash[:notice] = "Menu Item #{m.name} successfully created"
      redirect_to menu_items_path
    else
      flash[:warning] = 'Menu Item could not be entered'
      redirect_to new_menu_item_path
    end
  end

  def edit
    @menu_item = MenuItem.find params[:id]
  end

  def update
    @menu_item = MenuItem.find params[:id]
    @menu_item.update(create_update_params)
    flash[:notice] = "#{@menu_item.name} was successfully updated"
    redirect_to menu_item_path(@menu_item)
  end

  def destroy
    # load existing object again from URL param
    item = MenuItem.find(params[:id])
    # destroy object
    item.destroy
    respond_to do |format|
      format.html do
        # success message
        flash[:success] = 'Item removed successfully'
        redirect_to menu_items_path(params[:order])
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
    params.require(:menu_item).permit(:name, :description, :meal_of_day, :ingredients, :calories, :allergens, :diet, :status)
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
