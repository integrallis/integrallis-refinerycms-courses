class InstructorSkill < ActiveRecord::Base
  ajaxful_rateable :stars => 5, :allow_update => true
  
  belongs_to :instructor
  belongs_to :skill

  def title
    %[#{instructor.full_name} has the skill #{skill.name} with a rating average of #{self.rate_average}]
  end
  
end
