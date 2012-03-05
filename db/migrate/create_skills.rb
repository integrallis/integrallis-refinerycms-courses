class CreateSkills < ActiveRecord::Migration

  def self.up
    create_table :skills do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :skills, :id

    load(Rails.root.join('db', 'seeds', 'skills.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "skills"})

    Page.delete_all({:link_url => "/skills"})

    drop_table :skills
  end

end
