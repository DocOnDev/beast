class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :user_activity

  around_filter :set_time_zone


  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:time_zone, :first_name, :last_name, :email, :password, :password_confirmation) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:time_zone, :first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
    end

    def set_time_zone(&block)
      time_zone = current_user.try(:time_zone) || 'Central Time (US & Canada)'
      Time.use_zone(time_zone, &block)
    end

    def user_activity
      current_user.try :touch
    end
end
