module Admin
  class SkillsController < Admin::BaseController

    crudify :skill,
            :title_attribute => 'name', :xhr_paging => true

  end
end
