User.all.each do |user|
  if user.plugins.where(:name => 'course_parts').blank?
    user.plugins.create(:name => 'course_parts',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Course Parts',
  :link_url => '/course_parts',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/course_parts(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
