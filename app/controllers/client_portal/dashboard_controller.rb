# frozen_string_literal: true

module ClientPortal
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    def show
      unless current_user&.client?
        return redirect_to admin_clients_path if current_user&.admin? || current_user&.superadmin?

        return redirect_to login_path, alert: "Please sign in to continue."
      end

      @client = current_user.client
      if @client
        render template: "admin/clients/show"
      else
        redirect_to login_path, alert: "No client profile assigned yet."
      end
    end
  end
end
