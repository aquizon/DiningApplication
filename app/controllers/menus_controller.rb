class MenusController < ApplicationController
    def index
        @menus = Dininghall.menus #this needs to be tweaked or associated in seeds
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
