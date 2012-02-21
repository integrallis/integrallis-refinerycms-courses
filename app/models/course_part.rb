class CoursePart < ActiveRecord::Base
  belongs_to :course
  belongs_to :part
  
  acts_as_list :scope => :course
  acts_as_commentable
  
  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    "Override def title in vendor/engines/course_parts/app/models/course_part.rb"
  end
  
end
