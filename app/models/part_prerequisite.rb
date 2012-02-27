class PartPrerequisite < ActiveRecord::Base
  belongs_to :part
  belongs_to :prerequisite, :class_name => "Part", :foreign_key => "prerequisite_part_id"

  acts_as_indexed :fields => [:reason]

  validates :reason, :presence => true, :uniqueness => true
  
end
