class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!, :verify_admin

  def index
    @users = User.sort_user.page(params[:page]).per Settings.users.admin_index_size
    @user = User.all
  end

  def allpost
    @posts = Post.sort_feed.page(params[:page]).per Settings.posts.admin_post_size
    @post = Post.all
  end
end
