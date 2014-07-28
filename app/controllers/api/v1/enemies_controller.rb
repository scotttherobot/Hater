class Api::V1::EnemiesController < ApiController
   def index
      user = api_user
      @enemies = user.enemies
   end

   def create
      user = api_user
      person = User.find_by_username(params[:username])
      api_response(400, "user not found") and return unless person
      newEnemy = Enemy.new(:user_id => api_user.id, :person_id => person.id)
      api_response(400, "failed to add enemy") and return unless newEnemy.save
      user.reload
      @enemies = user.enemies
   end
end
