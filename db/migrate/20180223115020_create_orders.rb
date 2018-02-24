class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :table, foreign_key: true
      t.decimal :total, precision: 5, scale: 2

      t.timestamps
    end
  end
end
