class Instructor < ActiveRecord::Base
  include ActsAsAddressable
  
  acts_as_addressable
  acts_as_taggable
  ajaxful_rater
  acts_as_indexed :fields => [:first_name, :last_name, :email, :short_bio, :bio, :blog_url, :blog_rss_feed, :feed_type, :dc_creator_tag, :twitter_id, :street_address, :apt_suite_other, :city, :region, :postal_code, :country, :country_code, :phone_number, :gender, :website]

  validates :first_name, :presence => true, :uniqueness => true
  
  has_many :course_event_intructors
  has_many :course_events, :through => :course_event_intructors
  has_many :instructor_skills
  has_many :skills, :through => :instructor_skills
  
  def full_name
    %[#{first_name} #{last_name}]
  end
  
  def add_skill(skill_name, rate)
    skill = Skill.find_or_create_by_name(skill_name)
    instructor_skill = InstructorSkill.create(:instructor => self, :skill => skill)
    attendee = Attendee.where(:email => "guestuser@nowhere.com").first;
    instructor_skill.rate(rate, attendee)
  end
end
