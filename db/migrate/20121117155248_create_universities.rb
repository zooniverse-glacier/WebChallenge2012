class CreateUniversities < ActiveRecord::Migration
  def self.up
    create_table :universities do |t|
      t.string :name
      t.text :definition_of_service
      t.string :area_of_service
      t.string :contact
      t.timestamps
    end
  end

  def self.down
    drop_table :universities
  end
end
