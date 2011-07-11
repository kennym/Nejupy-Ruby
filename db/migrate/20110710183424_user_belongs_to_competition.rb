class UserBelongsToCompetition < ActiveRecord::Migration
  def self.up
    add_column "users", "competition_id", :integer
    add_index "users", "competition_id"
  end

  def self.down
  end
end
