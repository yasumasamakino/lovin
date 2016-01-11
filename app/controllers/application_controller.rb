class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name_sei
    devise_parameter_sanitizer.for(:sign_up) << :name_mei
    devise_parameter_sanitizer.for(:sign_up) << :name_sei_kana
    devise_parameter_sanitizer.for(:sign_up) << :name_mei_kana
    devise_parameter_sanitizer.for(:sign_up) << :sex
  end
end
