class AddTimelineToSchool < ActiveRecord::Migration
  def change
    remove_column :schools, :stage
    add_column :schools, :timeline_start_at, :datetime
    add_column :schools, :timeline_end_at, :datetime
  end
end
