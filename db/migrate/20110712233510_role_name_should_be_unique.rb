class RoleNameShouldBeUnique < ActiveRecord::Migration
  def self.up
    add_index :roles, :name, :unique => true
  end

  def self.down
  end
end
