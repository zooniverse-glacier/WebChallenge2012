class School < ActiveRecord::Base
  attr_accessible :name, :story, :enabled, :timeline_start_at, :position, :timeline_end_at, :events_attributes, :lat, :lng
  
  validates_presence_of :name
  validates_presence_of :story
  validates_presence_of :name
  validates_uniqueness_of :slug
  
  has_many :projects
  has_many :events
  
  validate :validate_dates
  before_save :slugify, :set_position
  
  accepts_nested_attributes_for :events, :allow_destroy => true
  
  def self.for_json
    includes(:projects).where('enabled = ?', true).order('position asc')
  end
  
  def self.list
    all.collect{ |s| [s.name, s.id] }
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
  
  def validate_dates
    return true unless timeline_start_at && timeline_end_at
    unless timeline_start_at < timeline_end_at
      errors.add(:timeline_end_at, "End time cannot be before start time")
      return false
    end
  end
end
