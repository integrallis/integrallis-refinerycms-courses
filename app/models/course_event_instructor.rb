class CourseEventInstructor < ActiveRecord::Base
  belongs_to :course_event
  belongs_to :instructor
  
  ajaxful_rateable :stars => 5

  def title
    %[#{instructor.full_name} is teaching #{course_event.title}]
  end
  
end
