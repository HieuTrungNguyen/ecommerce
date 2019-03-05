class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :unit_price, precision: 12, scale: 3
      t.string :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
