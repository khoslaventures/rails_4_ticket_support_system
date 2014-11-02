## Rails 4 Ticket Support System

### Instructions

* git clone https://github.com/stefioan/rails_4_ticket_support_system.git

* bundle install

* rake db:migrate

* Ready to use, launch the rails server locally to test.


Feel free to improve and report issues/bugs!


### Notices
1. This Rails 4 Ticket Support System is intended for guidance and educational purposes. If you wish to use it in one of your Rails apps keep in mind that It needs heavy refactoring and integration.

2. The email notifications are disabled. The current implementation was using Action Mailer (UserMailer). Please setup your desired structure.

### Features

* Uses SQLite3 for quick setup.
* Integrated with Devise, can easily be integrated with any other authentication system.
* Shows user's gravatar.
* Sends an email notification  to the user and admin when a ticket reply takes place.
* Proper styled email notification templates! (Created by [Nicholas Tart](http://nicholastart.com/))
* Ability top open/close tickets.
* Validation of not sending empty messages or tickets.
* Ordering tickets by status (open, close) and updated at.
* Basic layout with Twitter Bootstrap v3.

### Basic Security
* Basic before_filter security for controllers.
* All tickets have unique encrypted tokens and are safe from unauthorised access.



http://stefanosioannou.com
