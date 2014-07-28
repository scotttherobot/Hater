class Api::V1::InsultsController < ApiController
   def index
      @insults = Insult.all
   end
end
