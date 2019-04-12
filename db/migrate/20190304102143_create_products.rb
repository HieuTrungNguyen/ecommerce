class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 12, scale: 3
      t.integer :quantity
      t.string :image
      t.integer :del_flash, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
