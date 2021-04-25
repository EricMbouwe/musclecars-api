# README


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
$ bundle exec rspec spec/controllers/names_controller_spec.rb

# Generate fake password
` BCrypt::Password.create('azerty') `

# Seed the database
` heroku run rails db:seed `

It will give you 2 users you can login with
## email | password
- Admin: er@server.io | azerty
- User: jo@server.io | azerty