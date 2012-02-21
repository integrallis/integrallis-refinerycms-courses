Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'integrallis-refinerycms-courses'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Courses engine for Refinery CMS'
  s.date              = '2012-02-19'
  s.summary           = 'Courses engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
  
  # dependencies
  s.add_dependency "formtastic", ">= 2.0.2"
  s.add_dependency "acts_as_list", ">= 0.1.4"
  s.add_dependency "acts-as-taggable-on", ">= 2.2.2"
  s.add_dependency "transitions", ">= 0.0.13"
  s.add_dependency "eventbrite", ">= 0.3.0"
  s.add_dependency "acts_as_commentable", ">= 3.0.1"
  s.add_dependency "geocoder", ">= 1.1.1"
  s.add_dependency "acts_as_rateable", ">= 2.0.1"
end
