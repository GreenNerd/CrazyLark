class KeyValidate < ActiveRecord::Base
  def buy?
    if Cdkey.find_by(key: self.key)
      true
    else
      false
    end
  end 
end
