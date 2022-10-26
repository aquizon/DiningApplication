class DininghallsController < ApplicationController
    def index
        @dininghalls = Dininghall.all.order(:name)
    end

    def show 
        @dininghalls = Dininghall.find(params[:id])
    end

    def new 
        @dininghalls = Dininghall.new
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

private 
    def create_update_params
        params.require(:dininghall).permit(:name, :hours)
    end

end