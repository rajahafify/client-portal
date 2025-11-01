# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::DashboardController, type: :controller do
  let(:password) { "Password123!" }
  let(:admin_user) { User.create!(email: "admin@example.com", password:, role: :admin) }
  let(:client_user) { User.create!(email: "client@example.com", password:, role: :client) }

  describe "GET #show" do
    it "responds successfully for admin users" do
      session[:user_id] = admin_user.id

      get :show

      expect(response).to be_successful
    end

    it "redirects client users to their dashboard" do
      session[:user_id] = client_user.id

      get :show

      expect(response).to redirect_to(client_dashboard_path)
    end

    it "requires authentication" do
      get :show

      expect(response).to redirect_to(login_path)
    end
  end
end
