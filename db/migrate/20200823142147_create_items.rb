class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :status
      t.text :notes

      t.timestamps
    end
    add_index :items, :name, unique: true
  end
end
