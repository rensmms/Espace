class Contact < ActiveRecord::Base

  def fullname
    self.name
  end

end