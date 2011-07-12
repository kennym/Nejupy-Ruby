class UserBelongsToRole < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :integer
  end

  def self.down
  end
end
