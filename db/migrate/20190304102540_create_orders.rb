class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :customer_address
      t.string :customer_phone
      t.string :customer_city
      t.string :customer_country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
