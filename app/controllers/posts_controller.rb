class PostsController < ApplicationController
  before_action :verify_admin, only: :destroy
  before_action :load_post, only: [:show, :edit, :update, :destroy]

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
    @posttime = @post.created_at.getutc.iso8601
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
    params.require(:post).permit :title, :content, :picture, :all_tags
  end
end
