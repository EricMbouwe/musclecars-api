# Here we define what the cookies going to be structure like.
## the key here is the name of the session cookie
## The domain is the client production domain name
if Rails.env == "production"
  # Rails.application.config.session_store :cookie_store, key: "_musclecars_app", domain: :all
  Rails.application.config.session_store :cookie_store, key: "_musclecars_app", domain: 'musclecarsapp.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: "_musclecars_app"
end

