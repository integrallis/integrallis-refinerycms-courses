module Admin
  class InstructorsController < Admin::BaseController

    crudify :instructor,
            :title_attribute => 'first_name', :xhr_paging => true

  end
end
