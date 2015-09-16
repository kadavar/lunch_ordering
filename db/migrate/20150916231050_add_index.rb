class AddIndex < ActiveRecord::Migration
  def change
      add_index :users_roles, :user_id
      add_index :users_roles, :role_id
      add_index :users_roles, [:user_id, :role_id], unique: true
      add_index "users", ["email"], name: "index_users_on_email", unique: true
  end
end
