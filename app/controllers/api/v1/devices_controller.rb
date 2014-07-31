class Api::V1::DevicesController < ApiController

   ## Add a new push subscription
   def create
      user = api_user
      # Let's first look for existing devices with the same token. IF they
      # are there, let's delete them and assume that a new user logged in
      # on the device.
      oldDevice = Device.find_by_token(params[:token])
      if oldDevice
         oldDevice.destroy
      end

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
