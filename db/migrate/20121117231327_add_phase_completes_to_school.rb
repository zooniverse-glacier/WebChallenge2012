class AddPhaseCompletesToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :phase_1_complete, :boolean
    add_column :schools, :phase_2_complete, :boolean
    add_column :schools, :phase_3_complete, :boolean
  end
end
