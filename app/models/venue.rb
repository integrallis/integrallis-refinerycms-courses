class Venue < ActiveRecord::Base

  acts_as_commentable
  #acts_as_rateable
  acts_as_indexed :fields => [:name, :street_address, :apt_suite_other, :city, :region, :postal_code, :country, :country_code, :phone_number, :contact_name, :website]

  validates :name, :presence => true, :uniqueness => true
  
end
