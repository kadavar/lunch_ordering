class AddRoleIndex < ActiveRecord::Migration
  def change
    add_index :roles, :role, unique: true
  end
end
