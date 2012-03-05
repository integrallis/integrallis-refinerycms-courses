class SkillsController < ApplicationController

  before_filter :find_all_skills
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @skill in the line below:
    present(@page)
  end

  def show
    @skill = Skill.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @skill in the line below:
    present(@page)
  end

protected

  def find_all_skills
    @skills = Skill.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/skills").first
  end

end
