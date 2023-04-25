class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.integer :customer_id, null: false
      t.integer :postal_code, null: false
      t.text :place , null: false
      t.string :name , null: false
      t.timestamps
    end
  end
end
