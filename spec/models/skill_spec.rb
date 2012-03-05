require 'spec_helper'

describe Skill do

  def reset_skill(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @skill.destroy! if @skill
    @skill = Skill.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_skill
  end

  context "validations" do
    
    it "rejects empty name" do
      Skill.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_skill
      Skill.new(@valid_attributes).should_not be_valid
    end
    
  end

end