class CreatePermissionRoles < ActiveRecord::Migration
  def change
    create_table :permission_roles do |t|
      t.references :role
      t.references :permission

      t.timestamps
    end
    add_index :permission_roles, :role_id
    add_index :permission_roles, :permission_id
  end
end
