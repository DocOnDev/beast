class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :user_activity

  around_filter :set_time_zone

  private

  def set_time_zone(&block)
    time_zone = current_user.try(:time_zone) || 'Central Time (US & Canada)'
    Time.use_zone(time_zone, &block)
  end

  def user_activity
    current_user.try :touch
  end
end
