class AddDefaultValueToStatusInItems < ActiveRecord::Migration[6.0]
  def change
    change_column_default :items, :status, true
  end
end
