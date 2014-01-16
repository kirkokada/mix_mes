class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :mid
      t.string :time_sent
      t.text :body
      t.string :sender_uid

      t.timestamps
    end

    add_index :messages, :user_id
    add_index :messages, :mid
    add_index :messages, :time_sent
    add_index :messages, :sender_uid
  end
end
