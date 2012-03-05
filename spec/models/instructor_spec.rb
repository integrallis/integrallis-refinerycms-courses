require 'spec_helper'

describe Instructor do

  def reset_instructor(options = {})
    @valid_attributes = {
      :id => 1,
      :first_name => "RSpec is great for testing too"
    }

    @instructor.destroy! if @instructor
    @instructor = Instructor.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_instructor
  end

  context "validations" do
    
    it "rejects empty first_name" do
      Instructor.new(@valid_attributes.merge(:first_name => "")).should_not be_valid
    end

    it "rejects non unique first_name" do
      # as one gets created before each spec by reset_instructor
      Instructor.new(@valid_attributes).should_not be_valid
    end
    
  end

end