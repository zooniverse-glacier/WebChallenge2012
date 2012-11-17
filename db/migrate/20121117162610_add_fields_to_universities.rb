class AddFieldsToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :position, :integer, default: 0
    add_column :universities, :enabled, :boolean, default: false
  end
end
