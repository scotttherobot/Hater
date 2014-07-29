class User < ActiveRecord::Base
   has_many :enemies, :foreign_key => 'user_id'
   has_many :users, :through => :enemies, :foreign_key => 'person_id'
   has_many :devices

   attr_accessor :password
   before_save :encrypt_password
   after_initialize :init

   validates_confirmation_of :password
   validates_presence_of :password, :on => :create
   validates_uniqueness_of :username

   def init
   end

   def self.authenticate(username, password)
      user = find_by_username(username)

      if user && BCrypt::Password.new(user.password_hash) == password
         user
      else
         nil
      end
   end

   def encrypt_password
      if password.present?
         self.password_hash = BCrypt::Password.create(password)
      end
   end
end
