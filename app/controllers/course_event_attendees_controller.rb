class CourseEventAttendeesController < ApplicationController

  before_filter :find_all_course_event_attendees
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @course_event_attendee in the line below:
    present(@page)
  end

  def show
    @course_event_attendee = CourseEventAttendee.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @course_event_attendee in the line below:
    present(@page)
  end

protected

  def find_all_course_event_attendees
    @course_event_attendees = CourseEventAttendee.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/course_event_attendees").first
  end

end
