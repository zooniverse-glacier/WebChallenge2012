class AddUploadIdToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :upload_id, :integer
  end
end
