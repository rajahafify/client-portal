# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :user, optional: true

  validates :company_name, presence: true
  validates :contact_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact_no, presence: true
end
