class AddOtpTwoFactorToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :otp_secret_key, :string
    add_column :users, :otp_module, :integer, default: 0
  end

  def self.down
    remove_column :users, :otp_secret_key, :string
    remove_column :users, :otp_module, :integer
  end
end
