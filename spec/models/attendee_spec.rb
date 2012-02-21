require 'spec_helper'

describe Attendee do

  def reset_attendee(options = {})
    @valid_attributes = {
      :id => 1,
      :first_name => "RSpec is great for testing too"
    }

    @attendee.destroy! if @attendee
    @attendee = Attendee.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_attendee
  end

  context "validations" do
    
    it "rejects empty first_name" do
      Attendee.new(@valid_attributes.merge(:first_name => "")).should_not be_valid
    end

    it "rejects non unique first_name" do
      # as one gets created before each spec by reset_attendee
      Attendee.new(@valid_attributes).should_not be_valid
    end
    
  end

end