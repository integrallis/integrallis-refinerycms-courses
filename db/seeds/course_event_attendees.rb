User.all.each do |user|
  if user.plugins.where(:name => 'course_event_attendees').blank?
    user.plugins.create(:name => 'course_event_attendees',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Course Event Attendees',
  :link_url => '/course_event_attendees',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/course_event_attendees(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
