class RenameParticipantToUser < ActiveRecord::Migration
  def self.up
    change_table :solutions do |t|
      t.rename :participant_id, :user_id
    end
  end

  def self.down
  end
end
