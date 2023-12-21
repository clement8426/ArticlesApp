class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.all
    if params[:query].present?
      @posts = Post.search_by_title_and_content(params[:query])
    end
  end

  def profile
    @user = User.find(params[:user_id])
  end

  def my_profile
    @user = current_user
  end
end
