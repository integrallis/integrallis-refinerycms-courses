class CreateAttendees < ActiveRecord::Migration

  def self.up
    create_table :attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street_address
      t.string :apt_suite_other
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :country_code
      t.string :phone_number
      t.string :company
      t.string :gender
      t.string :website
      t.float :latitude
      t.float :longitude
      t.boolean :email_opt_in
      t.boolean :newsletter_opt_in
      t.integer :position

      t.timestamps
    end

    add_index :attendees, :id

    load(Rails.root.join('db', 'seeds', 'attendees.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "attendees"})

    Page.delete_all({:link_url => "/attendees"})

    drop_table :attendees
  end

end
