class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  def show
    @user = User.find_by(id: params[:id])
    @current_user_signed_in = @user == current_user
    if @current_user_signed_in
      @post = @user.posts.new
      @user_posts = @current_user.posts.order(updated_at: :desc)
    end
    unless @user
      flash[:error] = "Could not find user with that id"
      redirect_to :users
    end
  end

  def index
    @users = User.all
  end
end
