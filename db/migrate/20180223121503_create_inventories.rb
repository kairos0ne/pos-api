class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.text :description
      t.decimal :base_price, precision: 5, scale: 2
      t.decimal :retail_price, precision: 5, scale: 2
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
