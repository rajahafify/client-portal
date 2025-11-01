# frozen_string_literal: true

require "rails_helper"

RSpec.describe Client, type: :model do
  subject(:client) do
    described_class.new(
      company_name: "Acme Corp",
      contact_no: "123-456-7890",
      contact_email: "primary@acme.test"
    )
  end

  it "is valid with default attributes" do
    expect(client).to be_valid
  end

  it "requires a company name" do
    client.company_name = ""
    expect(client).not_to be_valid
    expect(client.errors[:company_name]).to include("can't be blank")
  end

  it "requires a contact number" do
    client.contact_no = nil
    expect(client).not_to be_valid
    expect(client.errors[:contact_no]).to include("can't be blank")
  end

  it "requires a contact email" do
    client.contact_email = ""
    expect(client).not_to be_valid
    expect(client.errors[:contact_email]).to include("can't be blank")
  end

  it "validates contact email format" do
    client.contact_email = "invalid-email"
    expect(client).not_to be_valid
    expect(client.errors[:contact_email]).to include("is invalid")
  end

  it "can optionally belong to a user" do
    user = User.create!(email: "owner@acme.test", password: "Password123!", role: :client)
    client.user = user

    expect(client).to be_valid
    expect(client.user).to eq(user)
  end
end
