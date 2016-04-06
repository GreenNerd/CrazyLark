class Cdkey < ActiveRecord::Base
  
  def key_initialize(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    str = ""
    1.upto(len) { |n| str << chars[rand(chars.size-1)] }
    str
  end

  def key_initialization
    loop do 
      self.key = key_initialization(16)
      break if !Cdkey.find_by(key: key)
    end
  end

#<Cdkey id: 7, key: "EkcMhPCBpYEbiUGv", created_at: "2016-04-06 02:30:52", updated_at: "2016-04-06 02:30:52">, 
#<Cdkey id: 8, key: "ngUNVhnq4KCUmJKE", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
#<Cdkey id: 9, key: "Jsk8g6CDsfyn0xVL", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
#<Cdkey id: 10, key: "iyhwZ318GfERh2C4", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
#<Cdkey id: 11, key: "uDNj1vwX6kQfXZZq", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
#<Cdkey id: 12, key: "8eUR5rmgbvqlzoBN", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
#<Cdkey id: 13, key: "usAWTUuUWsT7sovb", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
#<Cdkey id: 14, key: "DSNjgptzoXhNcmNB", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
#<Cdkey id: 15, key: "xFRsFQIJM0ekqG8G", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
#<Cdkey id: 16, key: "dcGnkig71oRz5E7A", created_at: "2016-04-06 02:32:28", updated_at: "2016-04-06 02:32:28">, 
end
