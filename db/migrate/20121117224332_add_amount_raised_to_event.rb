class AddAmountRaisedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :amount_raised, :integer
  end
end
