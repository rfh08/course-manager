class PostsController < ApplicationController
  def post
    @post= Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
    UserMailer.to_webmaster(@post).deliver_now
    flash[:success] = "Email sent"
    redirect_back(fallback_location: root_path)
    else
    flash[:success] = "Fail to send the email, please check your submit information is correct."
    redirect_back(fallback_location: root_path)
    end
  end
    
    
   private

    def post_params
      params.require(:post).permit(:name, :email, :message)
    end
    
end
