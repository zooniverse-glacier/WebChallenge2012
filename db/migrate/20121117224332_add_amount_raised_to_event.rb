class AddAmountRaisedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :amount_raised, :integer
    add_column :events, :phase, :integer
  end
end
