# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    redirect_post_login and return if user_signed_in?
  end

  def create
    user = User.find_by(email: params[:email].to_s.downcase)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_post_login
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Signed out successfully."
  end

  private

  def redirect_post_login
    case current_user&.role
    when "superadmin", "admin"
      redirect_to admin_dashboard_path
    when "client"
      redirect_to client_dashboard_path
    else
      session.delete(:user_id)
      redirect_to login_path, alert: "Unable to sign you in."
    end
  end
end
