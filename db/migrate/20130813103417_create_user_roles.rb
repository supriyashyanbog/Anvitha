class CreateUserRoles < ActiveRecord::Migration
  def self.up
    create_table :user_roles do |t|
      t.string :user_role_type
      t.text :permission_set

      t.timestamps
    end
  end

  def self.down
    drop_table :user_roles
  end
end
