class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :brands, :name, false
    change_column_null :categories, :name, false
    change_column_null :items, :user_id, true, -1
  end
end
