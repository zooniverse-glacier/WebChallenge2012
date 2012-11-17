class School < ActiveRecord::Base
  attr_accessible :name, :story, :enabled, :timeline_start_at, :position, :timeline_end_at, :events_attributes
  
  before_save :validate_dates
  validates_presence_of :name
  
  has_many :projects
  has_many :events
  
  accepts_nested_attributes_for :events, :allow_destroy => true
  
  def self.for_json
    includes(:projects).where('enabled = ?', true).order('position asc')
  end
  
  def self.list
    all.collect{ |s| [s.name, s.id] }
  end
  
  def validate_dates
    unless timeline_start_at < timeline_end_at
      errors.add(:timeline_end_at, "End time cannot be before start time")
      return false
    end
  end
end
