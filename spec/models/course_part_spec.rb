require 'spec_helper'

describe CoursePart do

  def reset_course_part(options = {})
    @valid_attributes = {
      :id => 1
    }

    @course_part.destroy! if @course_part
    @course_part = CoursePart.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_course_part
  end

  context "validations" do
    
  end

end