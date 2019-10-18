class SessionsController < ApplicationController
  def new
  end
  
  def create

    @categories = Category.all

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
    flash[:success] = "Log in successfully!"

      redirect_to courses_url

       # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email(username)/password combination' 
      render 'new'
    end
  end
  


 def adminnew
 end
  
  
  def destroy
     log_out
    redirect_to root_url
  end
end
