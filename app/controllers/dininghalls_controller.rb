class DininghallsController < ApplicationController
  before_action :admin_logged_in?, only: [:new, :create, :update]
  def index
    @dininghalls = Dininghall.all.order(:name)
  end

  def show
    @dininghall = Dininghall.find(params[:id])
    @dininghalls = Dininghall.all.order(:name)
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
      flash[:warning] = 'Dining hall could not be entered'
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
   
  def destroy
      # load existing object again from URL param
      dh = Dininghall.find(params[:id])
      # debugger
      # destroy object
      dh.destroy
      respond_to do |format|
        format.html do
          # success message
          flash[:success] = 'Dining Hall removed successfully'
          redirect_to dininghalls_path
        end
      end
  end

  private

  def create_update_params
    params.require(:dininghall).permit(:name, :hours)
  end
end

def admin_logged_in?
  return true if user_signed_in? && current_user.admin
  
  flash[:alert] = "Only admin users can create new Dining Halls"
  redirect_to new_user_session_path and return
end
