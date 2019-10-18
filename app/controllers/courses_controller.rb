class CoursesController < ApplicationController
    before_action :logged_in_user, only: [:new, :create,:edit, :update,:destroy]
    before_action :correct_user,  only:[:edit, :update]
    before_action :admin_user,    only: [:destroy]
    
    
  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      @course.category_ids = cateid_params
      @course.location_ids = locaid_params
      flash[:success] = "Course Created!"
      redirect_to courses_url
    else
      render 'new'
    end
  end


  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course deleted"
    redirect_to courses_url
  end
  
  def resize_to_fit(width, height)
  process :resize_to_fit => [width, height]
  end
  
  def index
  @course = Course.all
  end
  
  def new
    @course = Course.new
  end

  def show
  @course = Course.find(params[:id])
  end
  
  def edit
  @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params) && @course.update_attributes(category_ids: cateid_params) &&@course.update_attributes(location_ids: locaid_params)
      flash[:success] = "Course updated"
      redirect_to @course
    else
      render 'edit'
    end
  end


  private

    def course_params
    params.require(:course).permit(:name,:prerequisite,:description,:image)
    end
    
    def cateid_params
      params.require(:cate_ids)
    end
    
    def locaid_params
      params.require(:loca_ids)
    end
    
          # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
      store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = Course.find(params[:id]).user
      unless current_user?(@user) || current_user.admin?
      store_location
      flash[:danger] = "You are not the creator of the course" 
      redirect_to(courses_path) 
      end
    end
    
    
        # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
