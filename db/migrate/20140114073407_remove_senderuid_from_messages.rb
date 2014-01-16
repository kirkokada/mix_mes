class RemoveSenderuidFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :sender_uid, :integer
  end
end
