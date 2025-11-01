# frozen_string_literal: true

require "rails_helper"

RSpec.describe ClientsController, type: :controller do
  let(:password) { "Password123!" }
  let(:superadmin) { User.create!(email: "superadmin@example.com", password:, role: :superadmin) }
  let(:client_user) { User.create!(email: "client@example.com", password:, role: :client) }

  describe "GET #index" do
    it "responds successfully for superadmin users" do
      session[:user_id] = superadmin.id

      get :index

      expect(response).to be_successful
    end

    it "redirects client users to their dashboard" do
      session[:user_id] = client_user.id

      get :index

      expect(response).to redirect_to(my_client_path)
    end
  end
end
