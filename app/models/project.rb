class Project < ActiveRecord::Base
  attr_accessible :school_id, :description, :cost, :enabled
  validates_presence_of :school_id
  validates_presence_of :description
  validates_presence_of :cost
  
  belongs_to :school, counter_cache: true
end
