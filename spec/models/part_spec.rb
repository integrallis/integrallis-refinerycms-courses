require 'spec_helper'

describe Part do

  def reset_part(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @part.destroy! if @part
    @part = Part.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_part
  end

  context "validations" do
    
    it "rejects empty title" do
      Part.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_part
      Part.new(@valid_attributes).should_not be_valid
    end
    
  end

end