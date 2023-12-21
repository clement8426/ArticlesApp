class PostsController < ApplicationController
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

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
