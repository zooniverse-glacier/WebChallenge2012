class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :name
      t.integer :stage, default: 1
      t.text :story
      t.boolean :enabled, default: false
      t.integer :position, default: 0
      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
