class Project < ActiveRecord::Base
  attr_accessible :school_id, :description, :cost, :enabled
  
  belongs_to :school, counter_cache: true
end
