class Part < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]
  acts_as_taggable

  validates :title, :presence => true, :uniqueness => true
  
  has_many :course_parts
  has_many :part_prerequisites
  has_many :prerequisites, :through => :part_prerequisites, :source => :prerequisite
  
end
