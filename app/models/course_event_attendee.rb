class CourseEventAttendee < ActiveRecord::Base
  belongs_to :course_event
  belongs_to :attendee

  def title
    %[#{attendee.full_name} is enrolled in #{course_event.title}]
  end
  
end
