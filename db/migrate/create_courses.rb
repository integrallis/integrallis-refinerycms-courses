class CreateCourses < ActiveRecord::Migration

  def self.up
    create_table :courses do |t|
      t.string :title
      t.string :subtitle
      t.text :short_description
      t.text :long_description
      t.string :state
      t.integer :image_id
      t.string :format
      t.boolean :private
      t.integer :position

      t.timestamps
    end

    add_index :courses, :id

    load(Rails.root.join('db', 'seeds', 'courses.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "courses"})

    Page.delete_all({:link_url => "/courses"})

    drop_table :courses
  end

end
