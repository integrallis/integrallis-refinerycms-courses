require 'spec_helper'

describe Course do

  def reset_course(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @course.destroy! if @course
    @course = Course.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_course
  end

  context "validations" do
    
    it "rejects empty title" do
      Course.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_course
      Course.new(@valid_attributes).should_not be_valid
    end
    
  end

end