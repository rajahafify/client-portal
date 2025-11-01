# frozen_string_literal: true

require "rails_helper"

RSpec.describe ClientPortal::DashboardController, type: :controller do
  let(:password) { "Password123!" }
  let(:client_user) { User.create!(email: "client@example.com", password:, role: :client) }
  let(:admin_user) { User.create!(email: "admin@example.com", password:, role: :admin) }

  describe "GET #show" do
    it "renders successfully for a client with an assigned profile" do
      client = Client.create!(company_name: "Acme", contact_no: "123", contact_email: "contact@example.com", user: client_user)
      session[:user_id] = client_user.id

      get :show

      expect(response).to be_successful
      expect(controller.instance_variable_get(:@client)).to eq(client)
    end

    it "redirects clients without a profile back to login" do
      session[:user_id] = client_user.id

      get :show

      expect(response).to redirect_to(login_path)
    end

    it "redirects admins to the admin clients directory" do
      session[:user_id] = admin_user.id

      get :show

      expect(response).to redirect_to(admin_clients_path)
    end

    it "requires authentication" do
      get :show

      expect(response).to redirect_to(login_path)
    end
  end
end
