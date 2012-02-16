class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token

      t.integer :login_count, :null => false, :default => 0
      t.integer :failed_login_count, :null => false, :default => 0

      t.datetime :current_login_at
      t.datetime :last_login_at

      t.string :current_login_ip
      t.string :last_login_ip

      t.timestamps
    end
  end
end
