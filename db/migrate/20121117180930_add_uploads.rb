class AddUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.text :description
      t.string :image
      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
