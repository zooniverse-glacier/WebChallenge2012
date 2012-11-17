class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :school_id, required: true
      t.datetime :date
      t.string :description
      t.timestamps
    end
  end
end
