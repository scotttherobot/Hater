class Api::V1::HateController < ApiController
   def create
      # This is the controller where the magic happens.
      # We accept a list of a destination user and an insult id
      # and then send a push notification.
      user = api_user

      GCM.key = "AIzaSyA8_Rt7vvplk3gR8YrQwPjKJ-5QAyGvj8U"

      begin
         target = User.find(params[:target_user]);
         insult = Insult.find(params[:insult_id]);
         device = target.devices.first
      rescue
         api_response(400, "invalid parameters") and return
      end

      data = { :title => user.username, :message => insult.body }

      GCM.send_notification(device.token, data)

   end
end
