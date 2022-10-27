class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer :user_id
      t.integer :item_id
      t.float :price
      t.string :timestamp
      t.string :Time

      t.timestamps
    end
  end
end
