class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :school_id, required: true
      t.text :description
      t.integer :cost
      t.boolean :enabled, default: false
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
