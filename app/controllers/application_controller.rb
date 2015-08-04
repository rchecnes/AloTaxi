class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :dni << :role << :license
    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [:first_name, :last_name, :dni, :license, :role] }, :email, :password, :password_confirmation) }
    #devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :dni, :license, :roles)
  end
end
