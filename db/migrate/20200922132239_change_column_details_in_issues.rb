class ChangeColumnDetailsInIssues < ActiveRecord::Migration[6.0]
  def change
    change_column_null :issues, :details, false
  end
end
