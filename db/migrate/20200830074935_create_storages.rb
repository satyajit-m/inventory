class CreateStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :storages do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :qty
      t.datetime :procure_time
      t.integer :buffer

      t.timestamps
    end
  end
end
