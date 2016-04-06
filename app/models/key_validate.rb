class KeyValidate < ActiveRecord::Base
  validates :key, presence: true, length: { maximum: 16 }
end
