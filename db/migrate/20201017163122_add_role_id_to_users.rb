class AddRoleIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :role, null: false, foreign_key: true
    remove_column :users, :role, :string
  end
end
