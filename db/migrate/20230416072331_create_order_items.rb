class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :count, null: false
      t.string :money , null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
