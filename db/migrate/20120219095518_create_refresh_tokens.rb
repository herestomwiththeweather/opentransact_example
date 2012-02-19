class CreateRefreshTokens < ActiveRecord::Migration
  def change
    create_table :refresh_tokens do |t|
      t.belongs_to :person, :client
      t.string :token
      t.datetime :expires_at

      t.timestamps
    end
  end
end
