class Attendee < ActiveRecord::Base
  include ActsAsAddressable
  
  acts_as_addressable
  ajaxful_rater
  acts_as_indexed :fields => [:first_name, :last_name, :email, :street_address, :apt_suite_other, :city, :region, :postal_code, :country, :country_code, :phone_number, :company, :gender, :website]

  validates :first_name, :presence => true, :uniqueness => true
  
  has_many :course_event_attendees
  has_many :course_events, :through => :course_event_attendees
  
  def full_name
    %[#{first_name} #{last_name}]
  end
  
end
