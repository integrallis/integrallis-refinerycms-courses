class CreateVenues < ActiveRecord::Migration

  def self.up
    create_table :venues do |t|
      t.string :name
      t.string :street_address
      t.string :apt_suite_other
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :country_code
      t.string :phone_number
      t.string :contact_name
      t.float :latitude
      t.float :longitude
      t.integer :max_capacity
      t.integer :min_capacity
      t.string :website
      t.integer :position

      t.timestamps
    end

    add_index :venues, :id

    load(Rails.root.join('db', 'seeds', 'venues.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "venues"})

    Page.delete_all({:link_url => "/venues"})

    drop_table :venues
  end

end
