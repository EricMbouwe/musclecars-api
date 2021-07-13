# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins 'example.com'
#
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # insert the rule for the domains
  allow do
    origins 'http://localhost:3000' # local server of the front-end app

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :option, :head],
             credentials: true # allow to pass the cookies from the front-end app to the back-end
  end

  allow do
    origins 'https://musclecarsapp.herokuapp.com' # production server of the front-end app

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :option, :head],
             credentials: true # allow to pass the cookies from the front-end app to the back-end
  end
end
