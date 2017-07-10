class UsersController < ApplicationController
  before_action :load_user
  before_action :verify_admin, only: :destroy

  def show
    return if check_url @user
    @feed_items = @user.posts.sort_feed.page(params[:page]).per Settings.posts.feed_items
  end

  def following
    @title = t ".following"
    @users = @user.following.page(params[:page]).per Settings.users.follow_size
    render :show_follow
  end

  def followers
    @title = t ".followers"
    @users = @user.followers.page(params[:page]).per Settings.users.follow_size
    render :show_follow
  end

  def destroy
    if @user.destroy
      flash[:green] = t ".deleted"
      redirect_to admin_root_path
    else
      flash[:red] = t ".fail"
      render :back
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end
end
