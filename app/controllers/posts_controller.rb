class PostsController < ApplicationController
  before_action :correct_user, only: [:destroy, :edit, :update]
  before_action :load_post, only: [:show, :edit, :update]

  def create
    post = current_user.posts.build post_params

    if post.save
      flash[:green] = t ".success"
      redirect_to post
    else
      flash.now[:red] = t ".error"
      @feed_items = []
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:green] = t ".success"
      redirect_to @post
    else
      flash.now[:red] = t ".error"
      render :back
    end
  end

  def destroy
    if @post.destroy
      flash[:blue] = t ".post_deleted"
      redirect_to root_url
    else
      flash[:red] = t ".error"
      render :back
    end
  end

  private

  def load_post
    @post = Post.find_by id: params[:id]

    check_url @post
  end

  def post_params
    params.require(:post).permit :title, :content, :picture
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]
    redirect_to root_url unless @post
  end
end
