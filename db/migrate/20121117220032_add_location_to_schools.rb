class AddLocationToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :lat, :float
    add_column :schools, :lng, :float
  end
end
