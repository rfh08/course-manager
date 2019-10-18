class VotesController < ApplicationController
 before_action :set_course
 before_action :logged_in_user,    only: [:create, :dislike, :reset]
 before_action :admin_user,    only: [ :reset]
 
 
 def create
 if (current_user.is_liked(@course) || current_user.is_disliked(@course))
 flash[:danger] = "You can only vote a course once!" 
 redirect_back(fallback_location: root_path)
 else
 Vote.create_like(@course, current_user)
 flash[:success] = "Thanks for the votes" 
  redirect_back(fallback_location: root_path)
 end
 end
 
 def dislike
 if (current_user.is_disliked(@course) || current_user.is_liked(@course))
 flash[:danger] = "You can only vote a course once!" 
  redirect_back(fallback_location: root_path)
 else
 Vote.create_dislike(@course, current_user)
  flash[:success] = "Thanks for the votes" 
   redirect_back(fallback_location: root_path)
 end
 end
 
 def reset
 Vote.reset(@course)
 flash[:success] = "Vote reseted"
 redirect_back(fallback_location: root_path)
 end
 
 
 private
 
 def set_course
 @course=Course.find(params[:id],params[:type])
 end
 
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
  end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
