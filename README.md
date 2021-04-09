# README

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
# muscle-cars

# Generate model serializers
` rails g serializer model_name `

# Get routes in the browser
` http://localhost:3000/rails/info/routes `

# Clear the server PID file
` kill -9 $(lsof -i tcp:3000 -t) `

# Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
$ bundle exec rspec

# Run all spec files in a single directory (recursively)
$ bundle exec rspec spec/models

# Run a single spec file
$ bundle exec rspec spec/controllers/name_controller_spec.rb