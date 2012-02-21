module Admin
  class CoursesController < Admin::BaseController

    crudify :course, :xhr_paging => true

  end
end
