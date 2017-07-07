class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]

    return if check_url @user
    @feed_items = @user.posts.sort_feed.page(params[:page]).per Settings.posts.feed_items
  end
end
