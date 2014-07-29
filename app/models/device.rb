class Device < ActiveRecord::Base
  belongs_to :user

  after_initialize :init

  def init
     self.enabled = 1
  end

end
