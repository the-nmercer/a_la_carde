class AddDeviseFieldsToCustomers < ActiveRecord::Migration[6.0]
  def change
    change_table :customers, bulk: true do |t|
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.index :email, unique: true # Add the unique index for email
      t.index :reset_password_token, unique: true # Add the unique index for reset_password_token
    end
  end
end
