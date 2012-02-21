class Course < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :subtitle, :short_description, :long_description, :state, :format]
  acts_as_taggable

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :image
  has_many :course_parts, :order => :position
  
  def duration 
    duration = 0
    course_parts.each do |part|
      duration = duration + part.part.duration
    end
    duration = duration / 7 # hours in a day
    duration
  end
  
  def price
    price = 0
    course_parts.each do |part|
      price = price + part.part.price
    end
    price
  end
end
