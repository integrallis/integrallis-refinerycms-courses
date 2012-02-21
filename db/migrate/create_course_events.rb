class CreateCourseEvents < ActiveRecord::Migration

  def self.up
    create_table :course_events do |t|
      t.string :title
      t.text :description
      t.integer :course_id
      t.integer :venue_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :max_attendance
      t.integer :min_attendance
      t.integer :logo_id
      t.string :type
      t.string :state
      t.integer :position

      t.timestamps
    end

    add_index :course_events, :id

    load(Rails.root.join('db', 'seeds', 'course_events.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "course_events"})

    Page.delete_all({:link_url => "/course_events"})

    drop_table :course_events
  end

end
