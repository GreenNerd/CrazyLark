class Message < ActiveRecord::Base
  def seccode_match?
    if SendMessage.find_by(mobile: self.mobile)
      if self.seccode == SendMessage.find_by(mobile:self.mobile).seccode
         true
      else
         false
      end
    else
      false
    end
  end
end
