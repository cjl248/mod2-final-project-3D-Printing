# README

# Authentication
  - 1) Model to be authenticated should have a password_digest column. *Only use password_digest in migration. Everywhere else use password.*
  - 2) In the model put 'has_secure_password'
  - 3) [instance].authenticate("[password]") return false if the  password arg is not the same as the password in the database; otherwise returns the instance (truthy value)
