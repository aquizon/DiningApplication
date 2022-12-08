
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

    def show # this needs to be where filtering happens 
        if (Menu.where(id: params[:id]).empty?)
            flash[:notice] = "Menu does not exist"
            redirect_to menus_path
          else
            @menu = Menu.find(params[:id])
          end
    end
   
    # EVERYTHING BELOW HERE IS UNTESTED SO CHECK THAT SHIT
    # ALSO MAKE .HTML.ERBS 
    def new
      @menu = Menu.new
    end
  
    def create
      m = MenuItem.new(create_update_params)
      if m.save
        flash[:notice] = "Menu #{m.name} successfully created"
        redirect_to menu_items_path
      else
        flash[:warning] = 'Menu could not be entered'
        redirect_to new_menu_item_path
      end
    end
  
    def edit
      @menu= Menu.find params[:id]
    end
  
    def update
      @menu = Menu.find params[:id]
      @menu.update(create_update_params) # Need to add this method 
      flash[:notice] = "#{@menu.name} was successfully updated"
      redirect_to menu_path(@menu)
    end
  
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
end

