class CreateTransacts < ActiveRecord::Migration
  def change
    create_table :transacts do |t|
      t.belongs_to :asset, :payer, :payee
      t.string :to
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0
      t.string :note

      t.timestamps
    end
  end
end
