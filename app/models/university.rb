class University < ActiveRecord::Base
  attr_accessible :name, :definition_of_service, :area_of_service, :contact, :enabled, :position
  
  validates_presence_of :name
  validates_presence_of :definition_of_service
  validates_presence_of :area_of_service
  validates_uniqueness_of :slug
  
  before_save :slugify, :set_position
  
  def self.for_json
    where('enabled = ?', true).order('position asc')
  end
  
  def set_position
    self.position ||= self.class.select('distinct(position)').all.collect(&:position).max + 1
  end
  
  def slugify
    self.slug = name.parameterize.gsub '-', '_'
  end
  
  def to_param
    slug
  end
end
