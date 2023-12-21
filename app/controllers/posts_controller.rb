class PostsController < ApplicationController

  def index
    @posts = Post.all
    if params[:query].present?
      @posts = Post.search_by_title_and_content(params[:query])
    end
    if @posts.empty? && params[:query].present?
      flash.now[:alert] = "Aucun article trouvé pour la recherche '#{params[:query]}'"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments

  end

  def create_comment
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'commentaire ajouté avec succès.' }
        format.json { render json: @comment, status: :created, location: post_path(@post) }
      else
        format.html { render :show }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: 'Article ajouté avec succès.' }
        format.json { render json: @post, status: :created, location: my_profile_path }
      else
        format.html { render :show }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :url, :post_photo)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
