class CreateInstructorSkills < ActiveRecord::Migration

  def self.up
    create_table :instructor_skills do |t|
      t.integer :instructor_id
      t.integer :skill_id
      t.integer :position

      t.timestamps
    end

    add_index :instructor_skills, :id

    load(Rails.root.join('db', 'seeds', 'instructor_skills.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "instructor_skills"})

    Page.delete_all({:link_url => "/instructor_skills"})

    drop_table :instructor_skills
  end

end
