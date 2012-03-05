require 'spec_helper'

describe CourseEventAttendee do

  def reset_course_event_attendee(options = {})
    @valid_attributes = {
      :id => 1
    }

    @course_event_attendee.destroy! if @course_event_attendee
    @course_event_attendee = CourseEventAttendee.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_course_event_attendee
  end

  context "validations" do
    
  end

end