class Api::V1::HateController < ApiController
   def create
      # This is the controller where the magic happens.
      # We accept a list of a destination user and an insult id
      # and then send a push notification.
      # NOTE: This assumes the device is Android
      user = api_user

      GCM.key = "AIzaSyA8_Rt7vvplk3gR8YrQwPjKJ-5QAyGvj8U"

      begin
         target = User.find(params[:target_user]);
         insult = Insult.find(params[:insult_id]);
         devices = target.devices
      rescue
         api_response(400, "invalid parameters") and return
      end

      data = { :title => user.username, :message => insult.body }

      # Send it to all of their devices, because why not?
      devices.each do |device|
         if device.device_type.eql? "ANDROID"
            GCM.send_notification(device.token, data)
         end
         if device.device_type.eql? "IOS"
         end
      end

   end
end
