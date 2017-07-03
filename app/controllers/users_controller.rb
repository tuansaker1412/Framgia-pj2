class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]

    check_url @user
  end
end
