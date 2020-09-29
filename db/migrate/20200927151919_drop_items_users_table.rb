class DropItemsUsersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :items_users
  end
end
