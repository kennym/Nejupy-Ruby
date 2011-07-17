class CompetitionHasDefaultStatus < ActiveRecord::Migration
  def self.up
    change_column :competitions, :status, :integer, :default => 1
  end

  def self.down
    change_column :competitions, :status, :integer
  end
end
