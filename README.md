##CA Mailboxer
### Overview
This is a project for working with legacy code. The code itself is a simple mailbox application written with Ruby on Rails and based on Mailboxer framework. A user can sign up with an existing email and send/receive emails within this web application. Feature tests and unit tests are added into the legacy project. Bugs are fixed.
### Set up the application
If you don't have Rails installed beforehand, it is time to install it now. Rails is a ruby gem, so you can install it as any other gem:
```
$ gem install rails
```
Install needed gems.
```
$ bundle install
$ bundle exec rails generate rspec:install
```
Then you need to have postgresql installed in your computer and run the following command to create a database.
```
bundle exec rake db:create
bundle exec rake db:migrate
```
Start web server
```
$ rails s
```
Then you will have a server running on http://localhost:3000/
Sign up and log in to it. Try to add different users and send emails.
The system only sends emails within it. You cannot really send out an email.
