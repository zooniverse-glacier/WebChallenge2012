class Event < ActiveRecord::Base
  attr_accessible :date, :description, :amount_raised, :phase
  
  validates_presence_of :date
  validates_presence_of :description
  validates_presence_of :phase
  
  belongs_to :school
  
  default_scope order('date asc')
end
