User.all.each do |user|
  if user.plugins.where(:name => 'attendees').blank?
    user.plugins.create(:name => 'attendees',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Attendees',
  :link_url => '/attendees',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/attendees(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end

Attendee.create(:first_name => "Guest", :last_name => "User", :email => "guestuser@nowhere.com")
