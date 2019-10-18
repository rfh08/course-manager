class LocationsController < ApplicationController
  
  before_action :logged_in_user, only: [:new, :create]
  
  
  def show
  @location = Location.find(params[:id])
  @course = Course.all
  end
  
  def new
  @location = Location.new
  end
  
  def create
    @location = Location.new(location_params)
    if @location.save
    flash[:success] = "Location Created!"
       redirect_to @location
    else
      render 'new'
    end
  end
  

    private

    def location_params
      params.require(:location).permit(:location)
    end
    
    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
      store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
end
