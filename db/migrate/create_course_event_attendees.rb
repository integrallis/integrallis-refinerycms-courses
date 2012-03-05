class CreateCourseEventAttendees < ActiveRecord::Migration

  def self.up
    create_table :course_event_attendees do |t|
      t.integer :course_event_id
      t.integer :attendee_id
      t.integer :position

      t.timestamps
    end

    add_index :course_event_attendees, :id

    load(Rails.root.join('db', 'seeds', 'course_event_attendees.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "course_event_attendees"})

    Page.delete_all({:link_url => "/course_event_attendees"})

    drop_table :course_event_attendees
  end

end
