module NavigationHelpers
  module Refinery
    module Courses
      def path_to(page_name)
        case page_name
        when /the list of courses/
          admin_courses_path

         when /the new course form/
          new_admin_course_path
        when /the list of parts/
          admin_parts_path

         when /the new part form/
          new_admin_part_path
        when /the list of course_parts/
          admin_course_parts_path

         when /the new course_part form/
          new_admin_course_part_path
        when /the list of part_prerequisites/
          admin_part_prerequisites_path

         when /the new part_prerequisite form/
          new_admin_part_prerequisite_path
        when /the list of venues/
          admin_venues_path

         when /the new venue form/
          new_admin_venue_path
        when /the list of attendees/
          admin_attendees_path

         when /the new attendee form/
          new_admin_attendee_path
        when /the list of course_events/
          admin_course_events_path

         when /the new course_event form/
          new_admin_course_event_path
        else
          nil
        end
      end
    end
  end
end
