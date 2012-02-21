User.all.each do |user|
  if user.plugins.where(:name => 'part_prerequisites').blank?
    user.plugins.create(:name => 'part_prerequisites',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Part Prerequisites',
  :link_url => '/part_prerequisites',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/part_prerequisites(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
