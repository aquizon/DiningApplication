
class MenuItemsController < ApplicationController
  before_action :admin_logged_in?, only: [:new, :create, :destroy]
  def index
   #allergens = get_dietary_restrictions
   @menu_items = MenuItem.all
  end

  def show
    if (MenuItem.where(id: params[:id]).empty?)
      flash[:notice] = "Menu Item does not exist"
      redirect_to menu_path(session[:menu_id])
    else
      @menu_item = MenuItem.find(params[:id])
    end
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    m = MenuItem.new(create_update_params)
    m.allergens = get_allergens
    m.diet = get_diets
    if m.save
      flash[:notice] = "Menu Item #{m.name} successfully created"
      associate_items(session[:menu_id], m) unless session[:menu_id].nil?
      redirect_to menu_path(session[:menu_id]) unless session[:menu_id].nil?
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
    @menu_item.allergens = get_allergens
    @menu_item.diet = get_diets
    @menu_item.save
    #debugger
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
        redirect_to menu_path(session[:menu_id]) unless session[:menu_id].nil?
      end
    end
  end
  

  private

  def associate_items(menu_id, item)
    menu = Menu.find(menu_id)
    if menu.meal_of_day == "All Day"
      menus = Menu.where("dininghall_id = ?", menu.dininghall_id)
      menus.each do |m|
        m.menu_items << item # associate all day items to every menu
      end
    else
      menu.menu_items << item
    end
  end

  def create_update_params
    params.require(:menu_item).permit(:name, :description, :ingredients, :calories, :allergens, :diet, :status)
  end

  def get_allergens
    allergens = ""
    diets = ["dairy", "gluten", "soy", "nuts"]
    diets.each do |diet|
      if !params[diet].nil?
        allergens += diet.capitalize + ", "
      end
    end
    if allergens != "" 
      allergens = allergens.slice(0..-3)
    end
    allergens
  end

  def get_diets
    diets = ""
    groups = ["vegan", "vegetarian"]
    groups.each do |item|
      if !params[item].nil?
        diets += item.capitalize + ", "
      end
    end
      if diets != ""
        diets = diets.slice(0..-3)
      end
   diets
  end



 # def get_dietary_restrictions
   # diets = ["dairy", "gluten", "soy", "nuts", "vegan", "vegetarian"]
   # filter = []
   # diets.each do |diet|
   #   if !params[diet].nil?
    #    filter << diet
    #  end
  #  end
  #  filter
 # end


  def admin_logged_in?
    return true if user_signed_in? && current_user.admin
  
    flash[:alert] = "Only admin users can create new menu items"
    redirect_to new_user_session_path and return
  end
end
