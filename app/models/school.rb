class School < ActiveRecord::Base
  attr_accessible :name, :stage, :story, :enabled, :position
  
  has_many :projects
  
  def self.for_json
    includes(:projects).where('enabled = ?', true).order('position asc')
  end
  
  def self.list
    all.collect{ |s| [s.name, s.id] }
  end
end
