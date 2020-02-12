class AddOtpKeysToAdminUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :admin_users, :otp_secret_key, :string
    add_column :admin_users, :otp_module, :integer, default: 0
  end

  def self.down
    remove_column :admin_users, :otp_secret_key, :string
    remove_column :admin_users, :otp_module, :integer
  end
end
