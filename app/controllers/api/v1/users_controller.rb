class Api::V1::UsersController < ApiController
   skip_before_action :api_auth, only: [:create]

   def index
      @users = User.all
   end

   def create
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
   end

   def show
      @user = User.find(params[:id])
   end

   private

   def user_params
      params.require(:user).permit(:username, :password)
   end
end
