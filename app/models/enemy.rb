class Enemy < ActiveRecord::Base
  belongs_to :user, :class_name => 'User'
  belongs_to :person, :class_name => 'User'
end
