class CreateParts < ActiveRecord::Migration

  def self.up
    create_table :parts do |t|
      t.string :title
      t.text :description
      t.integer :duration_in_minutes
      t.decimal :price
      t.integer :position

      t.timestamps
    end

    add_index :parts, :id

    load(Rails.root.join('db', 'seeds', 'parts.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "parts"})

    Page.delete_all({:link_url => "/parts"})

    drop_table :parts
  end

end
