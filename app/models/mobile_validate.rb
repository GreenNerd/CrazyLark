class MobileValidate < ActiveRecord::Base
  def signed?
    if User.find_by(mobile: self.mobile)
      true
    else
      false
    end
  end
end
