class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :goods_genre_id, null: false
      t.string :item_name, null: false
      t.text :item_ex, null: false
      t.integer :price, null: false
      t.boolean :status, default: false, null: false

      t.timestamps
    end
  end
end
