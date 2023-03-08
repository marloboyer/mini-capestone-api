class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 9, scale: 2
      t.string :image_url
      t.text :description
      t.integer :inventory

      t.timestamps
    end
  end
end
