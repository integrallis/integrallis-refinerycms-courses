# Integrallis' Course Management Engine for Refinery CMS.

__A RefineryCMS Engine to Create/Manage and Sell Training Courses

## Installation

### As a GEM dependency in vendor/engines

* Clone this engine into vendor/engines/integrallis-refinerycms-courses
* To your Gemfile add: 
* gem 'integrallis-refinerycms-courses', '1.0', :path => 'vendor/engines'
* Then run:
* bundle install
* rails generate bookmans-refinerycms-clubs
* rake db:migrate

### As a GEM dependency in vendor/engines as a GIT submodule

* Add this engine as a submodule into vendor/engines/integrallis-refinerycms-courses
* 	git submodule add git@github.com:Intergalactic/bookmans-refinerycms-clubs.git vendor/engines/integrallis-refinerycms-courses
* To your Gemfile add: 
* gem 'integrallis-refinerycms-courses', '1.0', :path => 'vendor/engines'
* Then run:
* bundle install
* rails generate bookmans-refinerycms-clubs
* rake db:migrate

#### To develop from the vendor branch

* cd vendor/engines/integrallis-refinerycms-courses
* git remote add push git@github.com:Intergalactic/bookmans-refinerycms-clubs.git
* Now you can make changes to integrallis-refinerycms-courses from within the app and
*	git push origin master

## How to build this engine as a gem

    cd vendor/engines/clubs
    gem build integrallis-refinerycms-courses.gemspec
    gem install integrallis-refinerycms-courses.gem
    
    # Sign up for a http://rubygems.org/ account and publish the gem
    gem push integrallis-refinerycms-courses.gem