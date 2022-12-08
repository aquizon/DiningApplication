class MenusController < ApplicationController
    def index
        @menus = Dininghall.find_by_name(params[:dhName]).menus
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
