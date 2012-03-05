class CreatePartPrerequisites < ActiveRecord::Migration

  def self.up
    create_table :part_prerequisites do |t|
      t.integer :part_id
      t.integer :prerequisite_part_id
      t.string :reason
      t.integer :position

      t.timestamps
    end

    add_index :part_prerequisites, :id

    load(Rails.root.join('db', 'seeds', 'part_prerequisites.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "part_prerequisites"})

    Page.delete_all({:link_url => "/part_prerequisites"})

    drop_table :part_prerequisites
  end

end
