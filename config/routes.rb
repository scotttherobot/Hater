require 'api_constraints'

Rails.application.routes.draw do
   namespace :api, defaults: {format: 'json'} do
      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
         # resources :users
         resources :enemies, :only => [:index, :create]
         resources :insults, :only => [:index]
         resources :hate, :only => [:create]
         resources :devices, :only => [:create, :destroy]

         # Auth stuff
         post "login" => "sessions#create", :as => "log_in"
         delete "logout" => "sessions#destroy", :as => "log_out"
         resources :users, :only => [:create]
      end
   end
end
