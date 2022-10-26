class DininghallsController < ApplicationController
    def index
        @dininghalls = Dininghall.all.order(:name)
    end

    def show 
        @dininghall = Dininghall.find(params[:id])
    end

    def new 
        @dininghall = Dininghall.new
    end
    
    def create
        dh = Dininghall.new(create_update_params)
        if dh.save
            flash[:notice] = "Dining hall #{dh.name} successfully entered"
            redirect_to dininghalls_path
        else
            flash[:warning] = "Dining hall could not be entered"
            redirect_to new_dininghall_path
        end
    end

    def edit
        @dininghall = Dininghall.find params[:id]
    end 

    def update
        @dininghall = Dininghall.find params[:id]
        @dininghall.update(create_update_params)
        flash[:notice] = "#{@dininghall.name} was successfully updated"
        redirect_to dininghall_path(@dininghall)
    end
private 
    def create_update_params
        params.require(:dininghall).permit(:name, :hours, :breakfast_hours, :lunch_hours, :dinner_hours, :time, :menu)
    end

end