class AttendeesController < ApplicationController

  before_filter :find_all_attendees
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @attendee in the line below:
    present(@page)
  end

  def show
    @attendee = Attendee.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @attendee in the line below:
    present(@page)
  end

protected

  def find_all_attendees
    @attendees = Attendee.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/attendees").first
  end

end
