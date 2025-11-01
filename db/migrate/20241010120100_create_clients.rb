# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[8.1]
  def change
    create_table :clients do |t|
      t.string :company_name, null: false
      t.string :contact_no, null: false
      t.string :contact_email, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
