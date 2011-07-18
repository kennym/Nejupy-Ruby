class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
