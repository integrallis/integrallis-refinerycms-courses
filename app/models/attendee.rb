class Attendee < ActiveRecord::Base

  acts_as_indexed :fields => [:first_name, :last_name, :email, :street_address, :apt_suite_other, :city, :region, :postal_code, :country, :country_code, :phone_number, :company, :gender, :website]

  validates :first_name, :presence => true, :uniqueness => true
  
end
