class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy, :edit, :update]

  def create
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id

    if @comment.save
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error}
    end
  end

  def update
    if @comment.update comment_params
      render json: {status: :success, html: render_to_string(@post.comments)}
    else
      render json: {status: :error}
    end
  end

  def destroy
    if @comment.destroy
      render json: {status: :success}
    else
      render json: {status: :error}
    end
  end

  private

  def find_post
    @post = Post.find_by id: params[:post_id]

    check_url @post
  end

  def comment_params
    params[:comment].permit(:content)
  end

  def find_comment
    @comment = @post.comments.find_by id: params[:id]

    check_url @comment
  end
end
