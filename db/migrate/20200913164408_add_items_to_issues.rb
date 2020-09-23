class AddItemsToIssues < ActiveRecord::Migration[6.0]
  def change
    add_reference :issues, :item, index: true, null: false, after: :user_id
    add_column :issues, :resolved, :boolean, default: false, after: :details
  end
end
