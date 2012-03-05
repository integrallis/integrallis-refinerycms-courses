class Skill < ActiveRecord::Base
  acts_as_taggable
  acts_as_commentable
  acts_as_indexed :fields => [:name]
  
  has_many :instructor_skills
  has_many :instructors, :through => :instructor_skills

  validates :name, :presence => true, :uniqueness => true
  
end
