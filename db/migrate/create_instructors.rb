class CreateInstructors < ActiveRecord::Migration

  def self.up
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :short_bio
      t.text :bio
      t.string :blog_url
      t.string :blog_rss_feed
      t.string :feed_type
      t.boolean :blog_enabled
      t.string :dc_creator_tag
      t.string :twitter_id
      t.boolean :twitter_enabled
      t.string :street_address
      t.string :apt_suite_other
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :country_code
      t.string :phone_number
      t.string :gender
      t.string :website
      t.float :latitude
      t.float :longitude
      t.boolean :email_opt_in
      t.boolean :newsletter_opt_in
      t.integer :position

      t.timestamps
    end

    add_index :instructors, :id

    load(Rails.root.join('db', 'seeds', 'instructors.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "instructors"})

    Page.delete_all({:link_url => "/instructors"})

    drop_table :instructors
  end

end
