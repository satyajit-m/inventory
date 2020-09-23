class ChangeMaxBufferToBeIntegerInStorages < ActiveRecord::Migration[6.0]
  def change
    change_column :storages, :max_buffer, :integer, using: "max_buffer::integer"
  end
end
