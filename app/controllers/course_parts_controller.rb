class CoursePartsController < ApplicationController

  before_filter :find_all_course_parts
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @course_part in the line below:
    present(@page)
  end

  def show
    @course_part = CoursePart.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @course_part in the line below:
    present(@page)
  end

protected

  def find_all_course_parts
    @course_parts = CoursePart.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/course_parts").first
  end

end
