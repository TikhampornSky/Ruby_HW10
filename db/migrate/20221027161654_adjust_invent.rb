class AdjustInvent < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventories, :Time
  end
end
