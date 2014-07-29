class Api::V1::SessionsController < ApiController
   # We only need to skip api_auth for the login route
   skip_before_action :api_auth, only: [:create]

   # The login handler
   def create
      @user = User.authenticate(params[:username], params[:password])
      # If our user object is false (bad creds), thrown an error
      if !@user
         api_response(400, "Invalid credentials") and return
      end
      # Otherwise, give the user a new session.
      @user.update(:api_token => SecureRandom.hex)
   end

   # The logout handler
   def destroy
      @user = api_user
      if @user.update(:api_token => nil)
         api_response(200, 'logged out')
      end
   end

end
