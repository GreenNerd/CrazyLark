class Message < ActiveRecord::Base
  validates :mobile, presence:true, length: { maximum:11 }
  validates :seccode, presence:true, length: { maximum:6 }
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
