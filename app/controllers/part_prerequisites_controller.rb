class PartPrerequisitesController < ApplicationController

  before_filter :find_all_part_prerequisites
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @part_prerequisite in the line below:
    present(@page)
  end

  def show
    @part_prerequisite = PartPrerequisite.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @part_prerequisite in the line below:
    present(@page)
  end

protected

  def find_all_part_prerequisites
    @part_prerequisites = PartPrerequisite.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/part_prerequisites").first
  end

end
