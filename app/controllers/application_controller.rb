class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :update_account, if: :devise_controller?

  def check_url object
    return if object
    flash[:red] = t ".error"
    redirect_to root_path
  end

  def verify_admin
    unless current_user.is_admin?
      flash[:red] = t ".not_admin"
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
  end

  def update_account
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :avatar]
  end
end
