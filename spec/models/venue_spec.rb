require 'spec_helper'

describe Venue do

  def reset_venue(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @venue.destroy! if @venue
    @venue = Venue.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_venue
  end

  context "validations" do
    
    it "rejects empty name" do
      Venue.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_venue
      Venue.new(@valid_attributes).should_not be_valid
    end
    
  end

end