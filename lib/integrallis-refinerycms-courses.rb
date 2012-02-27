require 'refinerycms-base'
require 'formtastic'
require 'transitions'
require 'active_record/transitions'
require 'acts-as-taggable-on'
require 'acts_as_commentable'
require 'acts_as_rateable'
require 'acts_as_list'
require 'geocoder'

module Refinery
  module Courses
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "course_events"
          plugin.activity = {
            :class => CourseEvent
          }
        end
        
        Refinery::Plugin.register do |plugin|
          plugin.name = "attendees"
          plugin.activity = {
            :class => Attendee,
            :title => 'first_name'
          }
        end
        
        Refinery::Plugin.register do |plugin|
          plugin.name = "courses"
          plugin.activity = {
            :class => Course
          }
        end
        
        Refinery::Plugin.register do |plugin|
          plugin.name = "parts"
          plugin.activity = {
            :class => Part
          }
        end
        
        Refinery::Plugin.register do |plugin|
          plugin.name = "venues"
          plugin.activity = {
            :class => Venue,
            :title => 'name'
          }
        end
 
      end
    end
  end
end
