class InstructorsController < ApplicationController

  before_filter :find_all_instructors
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @instructor in the line below:
    present(@page)
  end

  def show
    @instructor = Instructor.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @instructor in the line below:
    present(@page)
  end

protected

  def find_all_instructors
    @instructors = Instructor.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/instructors").first
  end

end
