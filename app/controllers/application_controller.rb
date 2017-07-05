class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :update_account, if: :devise_controller?

  def check_url object
    return if object
    render file: "public/404.html", layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
  end

  def update_account
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :avatar]
  end
end
