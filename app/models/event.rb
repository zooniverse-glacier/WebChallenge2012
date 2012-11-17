class Event < ActiveRecord::Base
  attr_accessible :date, :description, :amount_raised, :phase
  
  belongs_to :school
end
