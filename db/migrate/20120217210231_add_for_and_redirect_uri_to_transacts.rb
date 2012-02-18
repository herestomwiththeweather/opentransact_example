class AddForAndRedirectUriToTransacts < ActiveRecord::Migration
  def change
    add_column :transacts, :redirect_uri, :string
    add_column :transacts, :for, :string
  end
end
