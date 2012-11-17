class University < ActiveRecord::Base
  attr_accessible :name, :definition_of_service, :area_of_service, :contact, :enabled, :position
  
  def self.for_json
    where('enabled = ?', true).order('position asc')
  end
end
