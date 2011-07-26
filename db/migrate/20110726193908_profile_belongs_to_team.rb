class ProfileBelongsToTeam < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.references :team
    end
  end

  def self.down
    remove_column :profiles, :team
  end
end
