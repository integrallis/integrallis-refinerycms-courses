require 'refinerycms-base'
require 'formtastic'
require 'transitions'
require 'active_record/transitions'
require 'acts-as-taggable-on'
require 'acts_as_commentable'
require 'acts_as_list'
require 'geocoder'
require 'ajaxful_rating'

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
        
        Refinery::Plugin.register do |plugin|
          plugin.name = "course_event_attendees"
          plugin.activity = {
            :class => CourseEventAttendee
          }
        end        
 
        Refinery::Plugin.register do |plugin|
          plugin.name = "instructors"
          plugin.activity = {
            :class => Instructor,
            :title => 'first_name'
          }
        end
        
        Refinery::Plugin.register do |plugin|
          plugin.name = "course_event_instructors"
          plugin.activity = {
            :class => CourseEventInstructor
          }
        end
        
        Refinery::Plugin.register do |plugin|
          plugin.name = "skills"
          plugin.activity = {
            :class => Skill,
            :title => 'name'
          }
        end
        
        Refinery::Plugin.register do |plugin|
          plugin.name = "instructor_skills"
          plugin.activity = {
            :class => InstructorSkill
          }
        end
 
      end
    end
  end
end
