module Admin
  class CourseEventsController < Admin::BaseController

    crudify :course_event, :xhr_paging => true

  end
end
