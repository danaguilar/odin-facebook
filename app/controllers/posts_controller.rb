class PostsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find_by(id: params[:user_id])
    if user == current_user
      #user is the current user
      post = user.posts.new(post_params)
      if post.save
        flash[:success] = "New post created!"
        redirect_to user
      else
        flash[:error] = "Error: Post could not be saved"
        redirect_to user
      end
    else
      flash[:error] = "Please log in to make a post"
      redirect_to new_user_session
    end
  end


  private
    def post_params
      params.require(:post).permit(:body)
    end
end
