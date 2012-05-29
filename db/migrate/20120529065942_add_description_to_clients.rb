class AddDescriptionToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :description, :string
  end

  def self.down
    remove_column :clients, :description
  end
end
