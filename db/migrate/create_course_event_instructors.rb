class CreateCourseEventInstructors < ActiveRecord::Migration

  def self.up
    create_table :course_event_instructors do |t|
      t.integer :course_event_id
      t.integer :instructor_id
      t.integer :position

      t.timestamps
    end

    add_index :course_event_instructors, :id

    load(Rails.root.join('db', 'seeds', 'course_event_instructors.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "course_event_instructors"})

    Page.delete_all({:link_url => "/course_event_instructors"})

    drop_table :course_event_instructors
  end

end
