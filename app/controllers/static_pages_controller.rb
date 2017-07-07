class StaticPagesController < ApplicationController
  def index
    return unless user_signed_in?
    @post = current_user.posts.build
    @feed_items = current_user.feed.sort_feed.page(params[:page]).per Settings.posts.feed_items
  end
end
