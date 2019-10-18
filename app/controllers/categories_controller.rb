class CategoriesController < ApplicationController
  
    before_action :logged_in_user, only: [:new, :create]
  
  def show
    @category = Category.find(params[:id])
    @course = Course.all

  end
  
  def new
     @category = Category.new
  end
  
    def create
    @category = Category.new(category_params)
    if @category.save
    redirect_to @category
    flash[:success] = "Category Created!"
    else
      render 'new'
    end
    end

  private

    def category_params
      params.require(:category).permit(:name)
    end

  
      # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
      store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
end
