class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.all
    @random_posts = @posts.sample(4)

  end

  def profile
    @user = User.find(params[:user_id])
  end

  def my_profile
    @user = current_user
  end
end
