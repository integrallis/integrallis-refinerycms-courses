class CreateCourseParts < ActiveRecord::Migration

  def self.up
    create_table :course_parts do |t|
      t.integer :course_id
      t.integer :part_id
      t.integer :position
      t.integer :position

      t.timestamps
    end

    add_index :course_parts, :id

    load(Rails.root.join('db', 'seeds', 'course_parts.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "course_parts"})

    Page.delete_all({:link_url => "/course_parts"})

    drop_table :course_parts
  end

end
