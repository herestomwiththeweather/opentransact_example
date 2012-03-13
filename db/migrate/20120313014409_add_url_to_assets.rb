class AddUrlToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :url, :string
  end
end
