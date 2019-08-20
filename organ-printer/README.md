# README

# Authentication
  - 1) Model to be authenticated should have a password_digest column. *Only use password_digest in migration. Everywhere else use password.*
  - 2) In the model put 'has_secure_password'
  - 3) [instance].authenticate("[password]") return false if the  password arg is not the same as the password in the database; otherwise returns the instance (truthy value)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
