class Event < ActiveRecord::Base
  attr_accessible :date, :description, :amount_raised
  
  belongs_to :school
end
