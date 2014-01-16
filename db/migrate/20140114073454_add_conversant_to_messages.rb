class AddConversantToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :conversant, :string
  end
end
