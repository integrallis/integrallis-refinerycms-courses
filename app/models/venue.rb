class Venue < ActiveRecord::Base
  include ActsAsAddressable
  
  acts_as_addressable
  acts_as_commentable
  acts_as_indexed :fields => [:name, :street_address, :apt_suite_other, :city, :region, :postal_code, :country, :country_code, :phone_number, :contact_name, :website]
  ajaxful_rateable :stars => 5

  validates :name, :presence => true, :uniqueness => true
  
  has_many :course_events
  has_many :courses, :through => :course_events
end
