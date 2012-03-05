class Course < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :subtitle, :short_description, :long_description, :state, :format]
  acts_as_taggable

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :image
  has_many :course_parts, :order => :position
  has_many :parts, :through => :course_parts
  
  def duration 
    parts.map(&:duration_in_minutes).inject(:+)
  end
  
  def price
    parts.map(&:price).inject(:+)
  end
  
  def schedule_it(starts_at, where)
    CourseEvent.create(:course => self, :title => self.title, :starts_at => starts_at, :venue => where)
  end

end
