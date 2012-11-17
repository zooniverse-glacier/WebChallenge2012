class Event < ActiveRecord::Base
  attr_accessible :date, :description
  
  belongs_to :school
end
