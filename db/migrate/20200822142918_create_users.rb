class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :status
      t.boolean :admin
      t.string :auth_token

      t.timestamps
    end
  end
end
