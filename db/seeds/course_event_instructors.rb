User.all.each do |user|
  if user.plugins.where(:name => 'course_event_instructors').blank?
    user.plugins.create(:name => 'course_event_instructors',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Course Event Instructors',
  :link_url => '/course_event_instructors',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/course_event_instructors(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
