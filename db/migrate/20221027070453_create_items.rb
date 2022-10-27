class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :price
      t.string :name
      t.integer :stock

      t.timestamps
    end
  end
end
