class School < ActiveRecord::Base
  attr_accessible :name, :stage, :story, :enabled, :position
  
  def self.for_json
    where('enabled = ?', true).order('position asc')
  end
end
