module Admin
  class InstructorSkillsController < Admin::BaseController

    crudify :instructor_skill, :xhr_paging => true

  end
end
