class ApiController < ApplicationController
  # By default, require auth for all api routes
  before_action :api_auth

  helper_method :api_user
  helper_method :api_auth
  helper_method :api_response

  private

  # Returns the currently authorized user. Returns false if no user.
  def api_user
     token = request.headers['Authorization']
     return @current_user ||= User.find_by_api_token(token) if token
  end

  # Useful as a before_filter for requiring authentication.
  # Will respond with an error message if a request does not have a valid
  # Authorization header.
  def api_auth
     api_response(403, "Invalid Authorization header") unless api_user
  end

  # Renders a basic JSON error message
  def api_response(status, message)
     render :json => {:status => status, :message => message}.to_json, :status => status
  end

end
