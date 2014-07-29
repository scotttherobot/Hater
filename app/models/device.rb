class Device < ActiveRecord::Base
  belongs_to :user

  after_initialize :init

  validates_presence_of :token
  validates_presence_of :device_type
  validates_uniqueness_of :token

  def init
     self.enabled = 1
  end

end
