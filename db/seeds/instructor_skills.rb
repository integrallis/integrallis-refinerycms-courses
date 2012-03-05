User.all.each do |user|
  if user.plugins.where(:name => 'instructor_skills').blank?
    user.plugins.create(:name => 'instructor_skills',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Instructor Skills',
  :link_url => '/instructor_skills',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/instructor_skills(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
