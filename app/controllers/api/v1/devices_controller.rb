class Api::V1::DevicesController < ApiController

   ## Add a new push subscription
   def create
      user = api_user
      @device = Device.new(:user => user, :device_type => params[:device_type], :token => params[:token])
      api_response(400, "device failed to register") and return unless @device.save
   end
   
   ## Remove a push subscription
   def destroy
      @device = Device.find_by_token(params[:token])
      api_response(200, "device removed") and return if @device.destroy
      api_response(400, "failed to remove device")
   end
end
