# frozen_string_literal: true

module Admin
  class ClientsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin!
    before_action :set_client, only: %i[show edit update destroy]

    def index
      @clients = Client.order(:company_name)
    end

    def show; end

    def new
      @client = Client.new
    end

    def create
      @client = Client.new(client_params)
      if @client.save
        redirect_to [:admin, @client], notice: "Client created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @client.update(client_params)
        redirect_to [:admin, @client], notice: "Client updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @client.destroy
      redirect_to admin_clients_path, notice: "Client deleted."
    end

    private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:company_name, :contact_no, :contact_email, :user_id)
    end
  end
end
