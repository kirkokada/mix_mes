class RenameConversantColumn < ActiveRecord::Migration
  def change
  	rename_column :messages, :conversant, :conversant_uid
  end
end
