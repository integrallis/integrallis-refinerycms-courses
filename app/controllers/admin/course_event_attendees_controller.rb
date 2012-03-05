module Admin
  class CourseEventAttendeesController < Admin::BaseController

    crudify :course_event_attendee, :xhr_paging => true

  end
end
