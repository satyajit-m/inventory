class ChangeMaxBufferToBeIntegerInStorages < ActiveRecord::Migration[6.0]
  def change
    change_column :storages, :max_buffer, :integer
  end
end
