class PartPrerequisite < ActiveRecord::Base

  acts_as_indexed :fields => [:reason]

  validates :reason, :presence => true, :uniqueness => true
  
end
