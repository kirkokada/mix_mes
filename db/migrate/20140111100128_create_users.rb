class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :provider
      t.string :name

      t.timestamps
    end

    add_index :users, [:uid, :provider]
  end
end
