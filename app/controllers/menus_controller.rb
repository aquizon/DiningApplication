class MenusController < ApplicationController
    def menu_index
        @menus = Menu.all.order(:meal_of_day)
      end

    def new 
        @menu = Menu.new
    end

    def create
        m = Menu.new(create_update_params)
        if m.save
            flash[:notice] = "Menu Item #{m.name} successfully entered"
            redirect_to menus_path
        else
            flash[:warning] = "Menu Item could not be entered"
            redirect_to new_book_path
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

private 
    def create_update_params
        params.require(:menu).permit(:name, :description, :meal_of_day, :ingredients, :calories, :allergens, :diet)
    end

end
