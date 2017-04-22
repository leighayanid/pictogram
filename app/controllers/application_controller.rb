class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate
  before_action :configure_permitted_parameters

  def authenticate
    unless ENV['HTTP_AUTH_USERNAME'].blank? or ENV['HTTP_AUTH_PASSWORD'].blank?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['HTTP_AUTH_USERNAME'] && password == ENV['HTTP_AUTH_PASSWORD']
      end
    end
  end

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :birthday, :email, :password, :remember_me)}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :last_name, :username, :birthday, :email, :password, :remember_me)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :username, :address, :bio, :birthday, :email, :password, :remember_me)}
  end

end
