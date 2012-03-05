# Integrallis' Course Management Engine for Refinery CMS.

A RefineryCMS Engine to Create/Manage and Sell Training Courses

## Domain

* _Course_: A training course. It can be a private course (use for custom courses for a given client). It's composed of parts (sections) and it has a price and estimated duration (based on its composing parts).
* _Part_: It's a subject/topic that can be taught in less than a day. Represents the atomic unit of instruction. Typically lasting from 1 to 4 hours on the average. It has a price and a duration.
* _PartPrerequisite_: Parts can have other parts as prerequisites.
* _CoursePart_: The one-to-many join model for Course(1)===>Part(*). It has a position and parts are commentable in the context of a course.
* _CourseEvent_: A course scheduled to be given at a certain date and time at a given Venue. A course has a given maximum and minimum. capacity, a type (codecamp style, private corporate training, public open enrollment and others), a state (draft, ready, published, postponed, cancelled). Course events are taggable, commentable and rateable. 
* _Venue_: A location/locale/classroom where a course can be taught. It has a maximum and minimum capacity and a list of amenities (wifi, food, coffee, restrooms).
* _Attendee_: A person attending a CourseEvent.
* _CourseEventAttendee_: An Attendee enrollment in a CourseEvent

## Integrations

### EventBrite

We want to be able to publish an event to EventBrite. To do so there is some extra information needed such as:
* Payment processing option: CC, PayPal, GoogleCheckout or Authorize.net
* Promotional information that can be used directly from EventBrite

For the integration we need to figure out if we embed the required information into the engine models or do we create 'integration' models

See http://developer.eventbrite.com. APIs methods to target:
 
* event_new/event_update: When publishing/updating/cancelling an CourseEvent
* venue_new/venue_get/venue_update: When publishing/updating a Venue
* ticket_new/ticket_update: To create ticket types/quantities for a CourseEvent
* discount_new/discount_update/event_list_discounts: To create discount codes for ticket types for a given event
* event_list_attendees: Once a ticket is sold and attendee is created in EventBrite that needs to be associated with an Attendee model

#### EventBrite Flow:

* Published online event page
  * Add at least one ticket type / donations for free events
  * Create discount/access codes
* Event Promotion: Privacy settings, promote on facebook 

#### Gems / Libraries

* https://github.com/ryanjarvinen/eventbrite-client.rb (official lib)
* https://github.com/therabidbanana/eventbrite
* http://github.com/ryanjarvinen/Eventbrite.jquery.js

#### Sources to research

* http://plugins.svn.wordpress.org/eventbrite-for-the-events-calendar/

### Promotion - Check for APIs

* Plancast
* Zevents
* Eventful
* Upcoming
* Facebook
* http://www.appguppy.com/

## Installation

### As a GEM dependency in vendor/engines

* Clone this engine into vendor/engines/integrallis-refinerycms-courses
* To your Gemfile add: 
* gem 'integrallis-refinerycms-courses', '1.0', :path => 'vendor/engines'
* Then run:
* bundle install
* rails generate refinerycms_courses
* rake db:migrate

### As a GEM dependency in vendor/engines as a GIT submodule

* Add this engine as a submodule into vendor/engines/integrallis-refinerycms-courses
* 	git submodule add git@github.com:integrallis/integrallis-refinerycms-courses.git vendor/engines/integrallis-refinerycms-courses
* To your Gemfile add: 
* gem 'integrallis-refinerycms-courses', '1.0', :path => 'vendor/engines'
* Then run:
* bundle install
* rails generate refinerycms_courses
* rake db:migrate

#### To develop from the vendor branch

* cd vendor/engines/integrallis-refinerycms-courses
* git remote add push git@github.com:integrallis/integrallis-refinerycms-courses.git
* Now you can make changes to integrallis-refinerycms-courses from within the app and
*	git push origin master

## How to build this engine as a gem

    cd vendor/engines/integrallis-refinerycms-courses
    gem build integrallis-refinerycms-courses.gemspec
    gem install integrallis-refinerycms-courses.gem
    
    # Sign up for a http://rubygems.org/ account and publish the gem
    gem push integrallis-refinerycms-courses.gem