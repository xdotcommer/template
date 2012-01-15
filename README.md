Rails 3 New Project Template
============================

This is a template that will set you up with a new project using:

* Postgres
* Devise
* Web App Theme
* Simple Form

And the following for testing:

* Rspec with Capybara & Factory Girl
* Database Cleaner, Shoula & Launchy
* Autotest with Growl

For development:

* Wirble
* Hirb
* Awesome Print
* Bullet

The project is all setup with a user signup & login flow (slightly modified from Devise), a layout, and specs.

To get started just:

* `clone https://github.com/xdotcommer/template.git my_project`
* `cd my_project ; rm -rf .git` make it your own!
* `bundle` set up the gems
* `rake db:create & rake db:migrate & rake` setup the database and run the tests
* `rails server` and have a look...