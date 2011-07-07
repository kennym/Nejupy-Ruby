class CreateCompetitions < ActiveRecord::Migration
  def self.up
    create_table :competitions do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :competitions
  end
end
