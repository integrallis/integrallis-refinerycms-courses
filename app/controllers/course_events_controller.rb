class CourseEventsController < ApplicationController

  before_filter :find_all_course_events
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @course_event in the line below:
    present(@page)
  end

  def show
    @course_event = CourseEvent.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @course_event in the line below:
    present(@page)
  end

protected

  def find_all_course_events
    @course_events = CourseEvent.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/course_events").first
  end

end
