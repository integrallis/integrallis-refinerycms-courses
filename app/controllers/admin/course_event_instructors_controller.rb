module Admin
  class CourseEventInstructorsController < Admin::BaseController

    crudify :course_event_instructor, :xhr_paging => true

  end
end
