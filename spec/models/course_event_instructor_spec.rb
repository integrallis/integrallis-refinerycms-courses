require 'spec_helper'

describe CourseEventInstructor do

  def reset_course_event_instructor(options = {})
    @valid_attributes = {
      :id => 1
    }

    @course_event_instructor.destroy! if @course_event_instructor
    @course_event_instructor = CourseEventInstructor.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_course_event_instructor
  end

  context "validations" do
    
  end

end