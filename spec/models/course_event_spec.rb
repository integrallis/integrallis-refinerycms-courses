require 'spec_helper'

describe CourseEvent do

  def reset_course_event(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @course_event.destroy! if @course_event
    @course_event = CourseEvent.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_course_event
  end

  context "validations" do
    
    it "rejects empty title" do
      CourseEvent.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_course_event
      CourseEvent.new(@valid_attributes).should_not be_valid
    end
    
  end

end