class PartsController < ApplicationController

  before_filter :find_all_parts
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @part in the line below:
    present(@page)
  end

  def show
    @part = Part.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @part in the line below:
    present(@page)
  end

protected

  def find_all_parts
    @parts = Part.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/parts").first
  end

end
