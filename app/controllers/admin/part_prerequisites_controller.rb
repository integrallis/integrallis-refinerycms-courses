module Admin
  class PartPrerequisitesController < Admin::BaseController

    crudify :part_prerequisite,
            :title_attribute => 'reason', :xhr_paging => true

  end
end
