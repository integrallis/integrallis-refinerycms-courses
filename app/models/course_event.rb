class CourseEvent < ActiveRecord::Base
  include ActiveRecord::Transitions
  
  acts_as_indexed :fields => [:title, :description, :type, :state]
  acts_as_taggable
  acts_as_commentable
  ajaxful_rateable :stars => 5, :allow_update => true

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :course
  belongs_to :venue
  belongs_to :logo, :class_name => 'Image'
  
  has_many :course_event_attendees
  has_many :attendees, :through => :course_event_attendees
  
  has_many :course_event_instructors
  has_many :instructors, :through => :course_event_instructors
  
  state_machine :auto_scopes => true do
    state :draft
    state :ready
    state :published
    state :postponed
    state :cancelled
    
    event :ready do
      transitions :to => :ready, :from => [:draft]
    end
    
    event :publish do
      transitions :to => :published, :from => [:ready, :postponed], :on_transition => [:publish_to_eventbrite]
    end
    
    event :cancel do
      transitions :to => :cancelled, :from => [:published, :postponed]
    end
    
    event :postpone do
      transitions :to => :postponed, :from => [:published, :cancelled]
    end
  end
  
  def enroll(attendee)
    CourseEventAttendee.create(:course_event => self, :attendee => attendee)
  end
  
  def publish_to_eventbrite
    puts "Publishing to EventBrite..."
  end
end
