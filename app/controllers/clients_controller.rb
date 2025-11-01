# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: %i[show edit update destroy]
  before_action :require_admin!, except: %i[show show_current]
  before_action :authorize_access!, only: :show

  def index
    @clients = Client.order(:company_name)
  end

  def show; end

  def show_current
    unless current_user&.client?
      return redirect_to clients_path if current_user&.admin? || current_user&.superadmin?

      return redirect_to login_path, alert: "Please sign in to continue."
    end

    @client = current_user.client
    if @client
      render :show
    else
      redirect_to login_path, alert: "No client profile assigned yet."
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: "Client created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: "Client deleted."
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def authorize_access!
    return if current_user&.superadmin? || current_user&.admin?
    return if current_user&.client? && current_user.client == @client

    redirect_to my_client_path, alert: "You are not authorized to view that client."
  end

  def client_params
    params.require(:client).permit(:company_name, :contact_no, :contact_email, :user_id)
  end
end
