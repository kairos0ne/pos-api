class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :icon_path
      t.string :photo_path

      t.timestamps
    end
  end
end
