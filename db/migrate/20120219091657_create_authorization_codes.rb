class CreateAuthorizationCodes < ActiveRecord::Migration
  def change
    create_table :authorization_codes do |t|
      t.belongs_to :person, :client
      t.string :token
      t.string :redirect_uri
      t.datetime :expires_at

      t.timestamps
    end
  end
end
