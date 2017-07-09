class UsersController < ApplicationController
  before_action :load_user

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

  private

  def load_user
    @user = User.find_by id: params[:id]
  end
end
