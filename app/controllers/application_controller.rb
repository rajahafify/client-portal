# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?

  add_flash_types :notice, :alert

  before_action :authenticate_user!

  private

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    return if user_signed_in?

    redirect_to login_path, alert: "Please sign in to continue."
  end

  def require_admin!
    return if current_user&.admin? || current_user&.superadmin?

    redirect_to client_dashboard_path, alert: "You are not authorized to access that page."
  end
end
