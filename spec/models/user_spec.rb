# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  let(:password) { "Password123!" }

  it "is valid with email, password, and role" do
    user = described_class.new(email: "admin@example.com", password:, role: :admin)
    expect(user).to be_valid
  end

  it "normalizes the email before validation" do
    user = described_class.create!(email: "ADMIN@EXAMPLE.COM", password:, role: :superadmin)
    expect(user.reload.email).to eq("admin@example.com")
  end

  it "requires emails to be unique (case insensitive)" do
    described_class.create!(email: "user@example.com", password:, role: :admin)

    duplicate = described_class.new(email: "USER@example.com", password:, role: :client)
    expect(duplicate).not_to be_valid
    expect(duplicate.errors[:email]).to include("has already been taken")
  end

  it "defaults the role to client" do
    user = described_class.create!(email: "client@example.com", password:)
    expect(user.role).to eq("client")
  end

  it "authenticates with the correct password" do
    user = described_class.create!(email: "secure@example.com", password:, role: :admin)
    expect(user.authenticate(password)).to eq(user)
    expect(user.authenticate("wrong")).to be false
  end
end
