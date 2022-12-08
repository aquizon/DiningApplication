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
end
