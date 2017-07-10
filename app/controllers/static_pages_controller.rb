class StaticPagesController < ApplicationController
  def index
    @posts = Post.sort_feed.page(params[:page]).per Settings.posts.post_index
    return unless user_signed_in?
    @post = current_user.posts.build
    feed_items_load = current_user.load_feed.sort_feed.page(params[:page])
    @feed_items = feed_items_load.per Settings.posts.feed_items
  end

  def home
    @posts = Post.sort_feed.page(params[:page]).per Settings.posts.feed_items
  end

  def search
    posts_load = Post.search_feed(params[:search])
    @posts = posts_load.sort_feed.page(params[:page]).per Settings.posts.feed_items
  end
end
