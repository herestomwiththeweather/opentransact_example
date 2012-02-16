class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.belongs_to :person
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
