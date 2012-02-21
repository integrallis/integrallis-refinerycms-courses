require 'spec_helper'

describe PartPrerequisite do

  def reset_part_prerequisite(options = {})
    @valid_attributes = {
      :id => 1,
      :reason => "RSpec is great for testing too"
    }

    @part_prerequisite.destroy! if @part_prerequisite
    @part_prerequisite = PartPrerequisite.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_part_prerequisite
  end

  context "validations" do
    
    it "rejects empty reason" do
      PartPrerequisite.new(@valid_attributes.merge(:reason => "")).should_not be_valid
    end

    it "rejects non unique reason" do
      # as one gets created before each spec by reset_part_prerequisite
      PartPrerequisite.new(@valid_attributes).should_not be_valid
    end
    
  end

end