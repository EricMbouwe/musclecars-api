class ApplicationController < ActionController::API
  skip_before_action :verify_authencity_token
end
