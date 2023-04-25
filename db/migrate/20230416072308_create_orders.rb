class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.string :postage, null: false
      t.string :postal_code, null: false
      t.text :place , null: false
      t.string :name, null: false
      t.integer :total_price, null: false
      t.integer :pay, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
