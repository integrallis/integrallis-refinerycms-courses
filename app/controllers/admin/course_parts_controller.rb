module Admin
  class CoursePartsController < Admin::BaseController

    crudify :course_part, :xhr_paging => true

  end
end
