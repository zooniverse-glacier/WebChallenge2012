class AddLocationToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :lat, :float
    add_column :universities, :lng, :float
  end
end
