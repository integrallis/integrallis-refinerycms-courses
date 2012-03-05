class InstructorSkillsController < ApplicationController

  before_filter :find_all_instructor_skills
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @instructor_skill in the line below:
    present(@page)
  end

  def show
    @instructor_skill = InstructorSkill.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @instructor_skill in the line below:
    present(@page)
  end

protected

  def find_all_instructor_skills
    @instructor_skills = InstructorSkill.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/instructor_skills").first
  end

end
