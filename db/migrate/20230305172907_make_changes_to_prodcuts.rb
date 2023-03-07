class MakeChangesToProdcuts < ActiveRecord::Migration[7.0]
  def change
    change_column :prodcuts, :description, :text

    change_column :prodcuts, :price, :decimal, precision: 9, scale: 2

    add_column :prodcuts, :inventory, :integer
  end
end
