class AddDefaultValueInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :email, false
    change_column_default :users, :status, true
    change_column_default :users, :admin, false
    remove_column :users, :doc, :string
  end
end
