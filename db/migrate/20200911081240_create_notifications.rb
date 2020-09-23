class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :receiver_id
      t.integer :sender_id
      t.datetime :read_at
      t.string :message
      t.integer :notifiable_id
      t.string :notifiable_type
      t.string :priority

      t.timestamps
    end
  end
end
