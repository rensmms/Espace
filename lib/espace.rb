require "espace/engine"

module Espace

  mattr_accessor :user_class
  mattr_accessor :current_user

  def self.user_class
    @@user_class.constantize
  end

  def self.current_user
    send(@@current_user)
  end
end
