# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_one :client, dependent: :nullify

  enum :role, { superadmin: "superadmin", admin: "admin", client: "client" }, default: "client", validate: true

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation :normalize_email

  scope :with_role, ->(role_name) { where(role: role_name) }

  private

  def normalize_email
    self.email = email.to_s.downcase
  end
end
