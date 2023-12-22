class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.all
    @posts = @posts.sample(3)

  end

  def profile
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def my_profile
    @user = current_user
    @posts = @user.posts
  end
end
