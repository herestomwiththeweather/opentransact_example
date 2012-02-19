class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.belongs_to :person, :client, :refresh_token
      t.string :token
      t.string :secret
      t.string :algorithm
      t.datetime :expires_at

      t.timestamps
    end
  end
end
