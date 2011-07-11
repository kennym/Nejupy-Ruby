class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.integer :user_id
      t.integer :problem_id
      t.integer :programming_language
      t.text :source_code

      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
