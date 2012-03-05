require 'spec_helper'

describe InstructorSkill do

  def reset_instructor_skill(options = {})
    @valid_attributes = {
      :id => 1
    }

    @instructor_skill.destroy! if @instructor_skill
    @instructor_skill = InstructorSkill.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_instructor_skill
  end

  context "validations" do
    
  end

end