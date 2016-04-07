class KeyValidate < ActiveRecord::Base
  validates :key, presence:true, length: { maximum:16 }
  validates :mobile, presence:true, length: { maximum:11 }
  validates :seccode, presence:true, length: { maximum:6 }
  def buy?
    if Cdkey.find_by(key: self.key)
      true
    else
      false
    end
  end 
end
