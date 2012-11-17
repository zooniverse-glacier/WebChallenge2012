class University < ActiveRecord::Base
  attr_accessible :name, :definition_of_service, :area_of_service, :contact, :enabled, :position
end
