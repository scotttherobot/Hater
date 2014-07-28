class Api::V1::UsersController < ApiController
   def index
      @users = User.all
   end

   def create
      @user = User.new(user_params)
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
