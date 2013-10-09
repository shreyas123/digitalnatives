class CreatePermissionUsers < ActiveRecord::Migration
  def change
    create_table :permission_users do |t|
      t.references :user
      t.references :permission

      t.timestamps
    end
    add_index :permission_users, :user_id
    add_index :permission_users, :permission_id
  end
end
