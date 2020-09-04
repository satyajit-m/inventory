class CreateStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :storages do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :qty, null: false
      t.integer :min_buffer, null: false
      t.string :max_buffer, null: false

      t.timestamps
    end
  end
end
