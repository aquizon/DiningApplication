
class MenusController < ApplicationController
    def index
        if !params[:dh_id].nil?
          dh_id = params[:dh_id]
        else
          menu = Menu.find(params[:menu_id])
          dh_id = menu.dininghall_id
        end
        
        @menus = Dininghall.find(dh_id).menus
    end

    def show 
        if (Menu.where(id: params[:id]).empty?)
            flash[:notice] = "Menu does not exist"
            redirect_to menus_path
          else
            @menu = Menu.find(params[:id])
          end
    end

    def filter
      allergens = get_dietary_restrictions
      @filters = []
      allergens.each do |allergy|
        if allergy != "vegan" && allergy != "vegetarian"
          @filters << allergy.capitalize + " Free"
        else
          @filters << allergy.capitalize
        end
      end
      if @filters.empty? 
        @filters << "No Filters"
      end
      @menu_items = Menu.sort_items_by(params[:menu_id], allergens)
    end
   
  
    def new
      @menu = Menu.new
    end
  
    def create
      m = Menu.new(create_update_params)
      m.dininghall_id = session[:dininghall_id]
      if m.save
        flash[:notice] = "Menu #{m.meal_of_day} successfully created"
        redirect_to menu_path(m.id)
      else
        flash[:alert] = 'Menu could not be entered'
        redirect_to new_menu_path
      end
    end
  
   # def edit
    #  @menu= Menu.find params[:id]
   # end
  
    def destroy
      # load existing object again from URL param
      menu = Menu.find(params[:id])
      dh = Dininghall.find(menu.dininghall_id)
      # destroy object
      menu.destroy
      respond_to do |format|
        format.html do
          # success message
          flash[:success] = 'Menu removed successfully'
          redirect_to menus_path(:dh_id => dh)
        end
      end
    end

    private

    def create_update_params
      params.require(:menu).permit(:meal_of_day, :begin_time, :end_time)
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
end

