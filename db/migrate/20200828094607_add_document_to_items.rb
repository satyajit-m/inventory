class AddDocumentToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :doc, :string
  end
end
