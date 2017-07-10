class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by id: params[:followed_id]

    if current_user.follow @user
      render json: {button_html: render_to_string(partial: "users/follow_form")}
    else
      render json: {status: :error}
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed

    if current_user.unfollow @user
      render json: {button_html: render_to_string(partial: "users/follow_form")}
    else
      render json: {status: :error}
    end
  end
end
