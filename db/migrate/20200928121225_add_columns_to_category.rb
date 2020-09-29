class AddColumnsToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :min_qty, :integer, null: false
    add_column :categories, :buffer, :integer, null: false
  end
end
