class CreateSolutionDetails < ActiveRecord::Migration
  def self.up
    create_table :solution_details do |t|
      t.integer :status
      t.integer :result
      t.integer :memory
      t.boolean :public
      t.integer :lang_id
      t.string :error
      t.string :lang_name
      t.string :lang_version
      t.float :exec_time
      t.datetime :date
      t.text :input
      t.text :output
      t.text :traceback
      
      t.references :solution
      t.timestamps
    end
  end

  def self.down
    drop_table :solution_details
  end
end
